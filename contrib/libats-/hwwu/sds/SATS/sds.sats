%{#
#include "sds/sds.h"
%}



absvtype sds

fun sdsnewlen(string, size_t): sds = "mac#"
fun sdsnew(string): sds = "mac#"
fun sdsempty(): sds = "mac#"
fun sdsdup(!sds): sds = "mac#"
fun sdsfree(sds): void = "mac#"
fun sdsgrowzero(sds, size_t): sds = "mac#" 

fun sdslen(!sds): size_t = "mac#"
fun sdsavail(!sds): size_t = "mac#"

fun sdscatlen(sds, string, size_t): sds = "mac#"
fun sdscat(sds, string): sds = "mac#"
fun sdscatsds(sds, !sds): sds = "mac#"
fun sdscatprintf {ts:t@ype} (sds, string, ts): sds = "mac#"
fun sdscatrepr(sds, string, size_t): sds  = "mac#"

fun sdscpylen(sds, string, size_t): sds = "mac#"
fun sdscpy(sds, !sds): sds = "mac#" 

fun sdstrim(!sds, string): void = "mac#"
fun sdsrange(!sds, int, int): void = "mac#"

fun sdscmp(!sds, !sds): int = "mac#"

fun sdssplitlen {n:int} (string, size_t, string, size_t, &int? >> int n): arrayptr (sds, n) = "mac#"
fun sdsfreesplitres {n:int} (arrayptr (sds, n), int n): void = "mac#"
fun sdssplitargs {n:int} (string, &int? >> int n): arrayptr (sds, n) = "mac#"

fun sdsmapchars(sds, string, string, size_t): sds  = "mac#"

fun sdstolower(sds): sds = "mac#"
fun sdstoupper(sds): sds = "mac#"

fun sdsfromlonglong(llint): sds = "mac#"

fun sdsjoinsds {n:int} (arrayptr (sds, n), int n, string, size_t): sds  = "mac#"


