/*
** Copyright (C) 2011 Chris Double.
**
** Permission to use, copy, modify, and distribute this software for any
** purpose with or without fee is hereby granted, provided that the above
** copyright notice and this permission notice appear in all copies.
** 
** THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
** WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
** MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
** ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
** WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
** ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
** OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
*/

/* ****** ****** */

#ifndef LIBEVENT_EVENT_CATS
#define LIBEVENT_EVENT_CATS

/* ****** ****** */

#include <event.h>

/* ****** ****** */

#define \
atscntrb_libevent_event_enable_debug_mode event_enable_debug_mode
#define atscntrb_libevent_event_debug_unassign event_debug_unassign

/* ****** ****** */

#define \
atscntrb_libevent_eventp_config_new eventp_config_new
#define \
atscntrb_libevent_eventp_config_free eventp_config_free
#define \
atscntrb_libevent_eventp_config_avoid_method eventp_config_avoid_method

/* ****** ****** */

#define atscntrb_libevent_event_base_new event_base_new
#define atscntrb_libevent_event_reinit event_reinit
#define atscntrb_libevent_event_base_dispatch event_base_dispatch
#define atscntrb_libevent_event_base_get_method event_base_get_method

/* ****** ****** */
//
#define \
atscntrb_libevent_event_base_get_features event_base_get_features
#define \
atscntrb_libevent_event_config_require_features event_config_require_features
//
#define \
atscntrb_libevent_event_config_set_flag event_config_set_flag
#define \
atscntrb_libevent_event_config_set_num_cpus_hint event_config_set_num_cpus_hint
//
#define atscntrb_libevent_event_base_free event_base_free
#define atscntrb_libevent_event_base_new_with_config event_base_new_with_config
//
/* ****** ****** */
//
#define atscntrb_libevent_event_base_set event_base_set
#define atscntrb_libevent_event_set_log_callback event_set_log_callback
#define atscntrb_libevent_event_set_fatal_callback event_set_fatal_callback
//
/* ****** ****** */
//
#define atscntrb_libevent_event_base_loop event_base_loop
//
#define atscntrb_libevent_event_base_loopexit event_base_loopexit
#define atscntrb_libevent_event_base_loopbreak event_base_loopbreak
//
#define atscntrb_libevent_event_base_got_exit event_base_got_exit
//
/* ****** ****** */

#endif // ifndef LIBEVENT_EVENT_CATS

/* ****** ****** */

/* end of [event.cats] */
