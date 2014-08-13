#include "share/atspre_staload.hats"
staload "sds.sats"
staload UN = "prelude/SATS/unsafe.sats"

assume sds = string
#define assert assert_errmsg

implement main0 () = () where {
    val x = sdsnew("foo")
    val () = assert(sdslen(x) = 3, "sdsnew, sdslen")
    val () = println! x
    val _ = sdsfree(x)
    
    val x = sdsnewlen("foo", i2sz 2)
    val () = assert(sdslen(x) = 2, "sdsnewlen")
    val () = println! x

    
    val x = sdscat(x, "bar")
    val () = assert(sdslen(x) = 5, "sdscat")
    val () = println! x

    val x = sdscpy(x, "a")
    val () = assert(sdslen(x) = 1, "sdscpy")
    val () = println! x
    
    val x = sdscpy(x, "xyzxxxxxxxxxxyyyyyyyyyykkkkkkkkkk")
    val () = assert(sdslen(x) = 33, "sdscpy")
    val () = println! x
    val () = sdsfree(x)    
    
    val x = sdscatprintf(sdsempty(), "%d", @(123))
    val () = assert(sdslen(x) = 3, "sdscatprintf")
    val () = println! x
    val () = sdsfree(x)
    
    val x = sdsnew("xxciaoyyy")
    val () = sdstrim(x, "xy")
    val () = assert(sdslen(x) = 4, "sdstrim")
    val () = println! x
    
    val y = sdsdup(x)
    val () = sdsrange(y, 1, 1)
    val () = assert(sdslen(y) = 1, "sdsrange")
    val () = println! y
    val () = sdsfree(y)
    
    val y = sdsdup(x)
    val () = sdsrange(y, 1, ~1)
    val () = assert(sdslen(y) = 3, "sdsrange")
    val () = println! y
    val () = sdsfree(y)
    
    val y = sdsdup(x)
    val () = sdsrange(y, ~2, ~1)
    val () = assert(sdslen(y) = 2, "sdsrange")
    val () = println! y
    val () = sdsfree(y)
    
    val y = sdsdup(x)
    val () = sdsrange(y, 2, 1)
    val () = assert(sdslen(y) = 0, "sdsrange")
    val () = println! y
    val () = sdsfree(y)
    
    val y = sdsdup(x)
    val () = sdsrange(y, 1, 100)
    val () = assert(sdslen(y) = 3, "sdsrange")
    val () = println! y
    val () = sdsfree(y)
    
    val y = sdsdup(x)
    val () = sdsrange(y, 100, 100)
    val () = assert(sdslen(y) = 0, "sdsrange")
    val () = println! y
    val () = sdsfree(y)
    
    val () = sdsfree(x)
    
    val x = sdsnew("bar")
    val y = sdsnew("bar")
    val () = assert(sdscmp(x, y) = 0, "sdscmp")
    val () = sdsfree(x)
    val () = sdsfree(y)
    
    val x = sdsnew("aar")
    val y = sdsnew("bar")
    val () = assert(sdscmp(x, y) < 0, "sdscmp")
    val () = sdsfree(x)
    val () = sdsfree(y)
    
    val x = sdsnewlen("\a\n\0foo\r", i2sz 7)
    val y = sdscatrepr(sdsempty(), x, sdslen(x))
    val () = println! y
    val () = assert(sdslen(y) = 14, "sdscatrepr")
    val () = sdsfree(y)
    val () = sdsfree(x)
    
    var count = 0
    val p = sdssplitlen("val x = sdsnew(\"aar\")", strlen("val x = sdsnew(\"aar\")"), " ", i2sz 1, count)
    val () = println! count
    val () = assert (count = 4, "sdssplitlen")
    val () = fprint_arrayptr_sep<string> (stdout_ref, p, i2sz count, "\n")
    val () = sdsfreesplitres(p, count)
    
    var count = 0
    val p = sdssplitlen("val x = sdsnew(\"aar\")", strlen("val x = sdsnew(\"aar\")"), " ", i2sz 1, count)
    val () = println! count
    val () = assert (count = 4, "sdssplitlen")
    val x = p[1]
    val _ = p[1] := sdsnew("hello")
    val () = println! x
    val () = fprint_arrayptr_sep<string> (stdout_ref, p, i2sz count, "\n")
    val () = sdsfreesplitres(p, count)

}