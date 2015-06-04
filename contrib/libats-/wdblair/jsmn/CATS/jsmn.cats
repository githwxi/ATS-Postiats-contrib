#ifndef _LIBATS_WDBLAIR_JSMN_CATS
#define _LIBATS_WDBLAIR_JSMN_CATS

#include <jsmn.h>

#define atscntrb_jsmn_jsmn_init jsmn_init
#define atscntrb_jsmn_jsmn_parse jsmn_parse

#define atscntrb_jsmn_jsmntok_type(tok) (((jsmntok_t*)tok)->type)
#define atscntrb_jsmn_jsmntok_size(tok) (((jsmntok_t*)tok)->size)
#define atscntrb_jsmn_jsmntok_start(tok) (((jsmntok_t*)tok)->start)
#define atscntrb_jsmn_jsmntok_end(tok) (((jsmntok_t*)tok)->end)

#endif
