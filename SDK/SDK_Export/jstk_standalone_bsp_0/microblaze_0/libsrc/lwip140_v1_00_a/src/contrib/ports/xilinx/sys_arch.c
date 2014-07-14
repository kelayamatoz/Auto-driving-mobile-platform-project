/* sys_arch.c -
 *	provide sys_arch functionality as required for lwIP
 *	most of this functionality is obtained from xilkernel
 *	this file acts as a wrapper around the xilkernel functions
 */

/*
 * Copyright (c) 2007 Xilinx, Inc.  All rights reserved.
 *
 * Xilinx, Inc.
 * XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS" AS A
 * COURTESY TO YOU.  BY PROVIDING THIS DESIGN, CODE, OR INFORMATION AS
 * ONE POSSIBLE   IMPLEMENTATION OF THIS FEATURE, APPLICATION OR
 * STANDARD, XILINX IS MAKING NO REPRESENTATION THAT THIS IMPLEMENTATION
 * IS FREE FROM ANY CLAIMS OF INFRINGEMENT, AND YOU ARE RESPONSIBLE
 * FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE FOR YOUR IMPLEMENTATION.
 * XILINX EXPRESSLY DISCLAIMS ANY WARRANTY WHATSOEVER WITH RESPECT TO
 * THE ADEQUACY OF THE IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO
 * ANY WARRANTIES OR REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE
 * FROM CLAIMS OF INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY
 * AND FITNESS FOR A PARTICULAR PURPOSE.
 *
 */

#include "xmk.h"
#include "sys/timer.h"
#include "sys/process.h"

#include "lwip/sys.h"
#include "lwip/opt.h"
#include "lwip/stats.h"

#include "arch/sys_arch.h"
#include "lwipopts.h"
#include "lwip/debug.h"

#include <errno.h>
#include <sys/time.h>
#include <sys/types.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <pthread.h>
#include <string.h>
#include "os_config.h"
#include "errno.h"

struct thread_start_param {
	struct sys_thread *thread;
	void (*function)(void*);
	void *arg;
};

struct sys_thread {
	pthread_t tid;
	struct thread_start_param tp;
};



/* statically allocate required structures */
struct sys_mbox_s      	lwip_mbox[SYS_MBOX_MAX];
struct sys_thread    	lwip_thread[SYS_THREAD_MAX];

static int SemaphoreCnt = 0;

void
sys_init ()
{
	int i;

	/* Initialize mailboxes */
	for (i = 0; i < SYS_MBOX_MAX; i++)
		lwip_mbox[i].used = 0;

	/* Initialize threads */
	for (i = 0; i < SYS_THREAD_MAX; i++)
		lwip_thread[i].tid = TID_FREE;
}

err_t
sys_sem_new(sys_sem_t *sem, u8_t count)
{
	int i;
	int shared = 0;

	if (SemaphoreCnt >= SYS_SEM_MAX)
		LWIP_DEBUGF(SYS_DEBUG, ("sys_sem_new: Out of semaphore resources"));
	if (sem_init(sem, shared, count) < 0) {
		LWIP_DEBUGF(SYS_DEBUG, ("sys_sem_new: Error while initializing semaphore 1: %d", errno));
		return ERR_MEM;
	}
	SemaphoreCnt++;

#if SYS_STATS
	lwip_stats.sys.sem.used++;
	if (lwip_stats.sys.sem.used > lwip_stats.sys.sem.max) {
		lwip_stats.sys.sem.max = lwip_stats.sys.sem.used;
	}
#endif
	return ERR_OK;
}

u32_t
sys_arch_sem_wait(sys_sem_t *sem, u32_t timeout)
{
#define SYS_MSPERTICK (SYSTMR_INTERVAL/SYSTMR_CLK_FREQ_KHZ)
#define TICKS_TO_MS(x) ((x) * SYS_MSPERTICK)


	if (timeout) {	/* Try to acquire the semaphore within timeout. If not return */
		u32_t ticks = xget_clock_ticks();
		u32_t nticks = 0;
		if (!sem_timedwait(sem, timeout)) {	/* sem_timedwait returns 0 on success */
			nticks = xget_clock_ticks();
			if (nticks >= ticks)
				return TICKS_TO_MS(nticks-ticks);
			else {
				/* overflow condition */
				/* we'll assume that this has overflowed just once */
				return TICKS_TO_MS((0xffffffff - ticks) + nticks);
			}
		} else {
			return SYS_ARCH_TIMEOUT;
		}
	} else  {
		sem_wait(sem);
	}

	return 0;
}

void
sys_sem_signal(sys_sem_t *sem)
{
	sem_post(sem);
}

void
sys_sem_free(sys_sem_t *sem)
{

#if SYS_STATS
	lwip_stats.sys.sem.used--;
#endif
	sem_destroy(sem);
	*sem = SEM_FREE;
	if (SemaphoreCnt > 0)
		SemaphoreCnt--;

}

err_t
sys_mbox_new(sys_mbox_t* mbox, int size)
{
	int i;

	/* The size parameter is new in lwIP-1.3.0 (compared to lwIP-1.2.0.
	 * For now, we just make sure that our default size is bigger than the requested size
	 */
	if (SemaphoreCnt >= (SYS_SEM_MAX - 1))
		LWIP_DEBUGF(SYS_DEBUG, ("sys_sem_new: Out of semaphore resources"));

	if (size > SYS_MBOX_SIZE) {
		LWIP_DEBUGF(SYS_DEBUG, ("sys_mbox_new: Error - requested mailbox size (%d) > SYS_MBOX_SIZE", size));
		return ERR_MEM;
	}

	for (i = 0; i < SYS_MBOX_MAX; i++)
		if (!lwip_mbox[i].used)
			break;

	if (i == SYS_MBOX_MAX) {
		LWIP_DEBUGF(SYS_DEBUG, ("sys_mbox_new: Error - Out of mailbox resources."));
		return ERR_MEM;
	}

	memcpy((void *)mbox, (void *)&(lwip_mbox[i]), sizeof(sys_mbox_t));
	mbox->first = mbox->last = 0;

	/* mbox->mail indicates whether mail is available */
	if (sem_init(&(mbox->mail), 0, 0) < 0 ) {
		LWIP_DEBUGF(SYS_DEBUG, ("sys_mbox_new: Error - While initializing semaphore 'mail': %d.", errno));
		return ERR_MEM;
	}
	SemaphoreCnt++;

	/* mbox->mutex controls access to the mbox */
	if (sem_init(&(mbox->mutex), 0, 1) < 0 ) {
		LWIP_DEBUGF(SYS_DEBUG, ("sys_mbox_new: Error - While initializing semaphore 'mutex': %d.", errno));
		return ERR_MEM;
	}
	SemaphoreCnt++;
	mbox->used = 1;

#if SYS_STATS
	lwip_stats.sys.mbox.used++;
	lwip_stats.sys.sem.used += 2;
	if (lwip_stats.sys.mbox.used > lwip_stats.sys.mbox.max) {
		lwip_stats.sys.mbox.max = lwip_stats.sys.mbox.used;
	}
#endif /* SYS_STATS */

	return ERR_OK;
}

void
sys_mbox_free (sys_mbox_t *mbox)
{
	if(mbox != SYS_MBOX_NULL) {
#if SYS_STATS
		lwip_stats.sys.mbox.used--;
		lwip_stats.sys.sem.used -= 2;
#endif /* SYS_STATS */
		sem_wait (&(mbox->mutex));
		sem_destroy (&(mbox->mail));
		sem_destroy (&(mbox->mutex));
		mbox->used = 0;
		if (SemaphoreCnt > 1)
			SemaphoreCnt = SemaphoreCnt - 2;
	}
}

void
sys_mbox_post (sys_mbox_t *mbox, void *msg)
{
	u8_t first;

	/* first obtain mutex to access mbox */
	if (sem_wait(&mbox->mutex)) {
		LWIP_DEBUGF(SYS_DEBUG, ("sys_mbox_post: Error - While locking mutex for mbox: %d", errno));
		return;
	}

	/* post the message */
	mbox->msgs[mbox->last] = msg;

	if (mbox->last == mbox->first)
		first = 1;
	else
		first = 0;

	/* ignores overflow conditions (cannot post > SYS_MBOX_SIZE messages) */
	mbox->last++;
	if (mbox->last == SYS_MBOX_SIZE)
		mbox->last = 0;

	sem_post(&mbox->mail);

	sem_post (&mbox->mutex);
}

err_t
sys_mbox_trypost (sys_mbox_t *mbox, void *msg)
{
	u8_t first;

	/* first obtain mutex to access mbox */
	if (sem_trywait(&mbox->mutex) < 0) {
		return ERR_MEM;
	}

	/* post the message */
	mbox->msgs[mbox->last] = msg;

	if (mbox->last == mbox->first)
		first = 1;
	else
		first = 0;

	/* ignores overflow conditions (cannot post > SYS_MBOX_SIZE messages) */
	mbox->last++;
	if (mbox->last == SYS_MBOX_SIZE)
		mbox->last = 0;

	sem_post(&mbox->mail);

	sem_post (&mbox->mutex);

	return ERR_OK;
}

u32_t
sys_arch_mbox_fetch(sys_mbox_t *mbox, void **msg, u32_t timeout)
{
	u32_t start_ticks = 0;
	u32_t stop_ticks = 0;
	u32_t ticks = 0;

	/* The mutex lock is quick so we don't bother with the timeout stuff here. */
	sem_wait(&mbox->mutex);

	while (mbox->first == mbox->last) {
		/* no messages in mailbox, relinqush control */
		sem_post(&mbox->mutex);

		/* Block w/ timeout while waiting for a mail to arrive in the mailbox. */
		if (timeout) {    /* Try to acquire the semaphore within timeout. If not return */
			int pid;

			start_ticks = xget_clock_ticks();
			pid = get_currentPID();
			if (sem_timedwait(&mbox->mail, timeout)) {
				return SYS_ARCH_TIMEOUT;
			}
			stop_ticks = xget_clock_ticks();
		} else {
			sem_wait (&mbox->mail);
		}

		/* now that there is a message, regain control of mailbox */
		sem_wait (&mbox->mutex);
	}

	/* obtain the first message */
	if (msg != NULL) {
		*msg = mbox->msgs[mbox->first];
	}

	mbox->first++;
	if(mbox->first == SYS_MBOX_SIZE) {
		mbox->first = 0;
	}

	/* relinqush control of the mailbox */
	sem_post(&mbox->mutex);

	/* find out how much time it took us */
	if (stop_ticks >= start_ticks)
		ticks = stop_ticks - start_ticks;
	else
		ticks = (0xffffffff - start_ticks) + stop_ticks;

	return TICKS_TO_MS(ticks);
}

u32_t
sys_arch_mbox_tryfetch(sys_mbox_t *mbox, void **msg)
{
	/* required in lwIP-1.3.0. Initial naive implementation: */
	return sys_arch_mbox_fetch(mbox, msg, 1);
}


static struct sys_thread *
current_thread(void)
{
	int i;
	pthread_t me;

	me = pthread_self();

	for (i = 0; i < SYS_THREAD_MAX; i++) {
		if (lwip_thread[i].tid == me)
			return &lwip_thread[i];
	}

	LWIP_DEBUGF(SYS_DEBUG, ("current_thread: Error - could not find current thread"));
	abort();
}

static void *
thread_start(void *arg)
{
	struct thread_start_param *tp = arg;
	tp->function(tp->arg);
	tp->thread->tid = TID_FREE;      /* Free up the thread structure */
	return NULL;
}

sys_thread_t
sys_thread_new(const char *name, void (* function)(void *arg), void *arg, int stacksize, int prio)
{
	int i, ret;
	sys_thread_t thread = NULL;
	pthread_attr_t attr;
#if SCHED_TYPE == SCHED_PRIO
	struct sched_param sched;
#endif

	/* stacksize & name parameters are new in lwIP-1.3.0
	 * for stacksize, we just make sure that xilkernel default thread stack size is >
	 * than the request stack size.
	 * the name parameter is ignored.
	 */

	if (stacksize > PTHREAD_STACK_SIZE) {
		LWIP_DEBUGF(SYS_DEBUG, ("sys_thread_new: requested stack size (%d) \
					> xilkernel PTHREAD_STACK_SIZE (%d)",
					stacksize, PTHREAD_STACK_SIZE));
		return NULL;
	}

	for (i = 0; i < SYS_THREAD_MAX; i++)
		if (lwip_thread[i].tid == TID_FREE)
			break;

	if (i == SYS_THREAD_MAX) {
		LWIP_DEBUGF(SYS_DEBUG, ("sys_thread_new: Out of lwip thread structures"));
		return NULL;
	}


	thread = &lwip_thread[i];

	thread->tp.function = function;
	thread->tp.arg = arg;
	thread->tp.thread = thread;

	pthread_attr_init (&attr);
#if SCHED_TYPE == SCHED_PRIO
	sched.sched_priority = prio;
	pthread_attr_setschedparam(&attr, &sched);
#endif
	if((ret = pthread_create(&(thread->tid), &attr, thread_start, &(thread->tp))) != 0) {
		LWIP_DEBUGF(SYS_DEBUG, ("sys_thread_new: Error in pthread_create: %d", ret));
		abort();
	}

	return thread;
}

int sys_mbox_valid(sys_mbox_t *mbox)
{
	if (mbox->used == 0)
		return 0;
	return 1;
}

void sys_mbox_set_invalid(sys_mbox_t *mbox)
{

}

int sys_sem_valid(sys_sem_t *sem)
{
	if (*sem == SEM_FREE)
		return 0;
	return 1;
}

void sys_sem_set_invalid(sys_sem_t *sem)
{

}
