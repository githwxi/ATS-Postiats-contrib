(*
** HttpClient library
*)

(* ****** ****** *)

%{#
#include \
"arduino/CATS/Bridge/HttpClient.cats"
%} // end of [%{#]

(* ****** ****** *)

(*
class HttpClient : Process
*)
abst@ype
HttpClient =
$extype"HttpClient"
abstype HttpClient_ptr = ptr

(* ****** ****** *)
//
fun
HttpClient(): HttpClient_ptr = "mac#"
//
(* ****** ****** *)
//
fun HttpClient_ready(): bool = "mac#"
//
fun HttpClient_getResult(): uint = "mac#"
//
fun HttpClient_checkSSL(): void = "mac#"
fun HttpClient_noCheckSSL(): void = "mac#"
//
(* ****** ****** *)

fun
HttpClient_get_string(url: string): uint = "mac#"
fun
HttpClient_getAsynchronously_string(string): uint = "mac#"

(* ****** ****** *)
//
fun
HttpClient_post_string
  (url: string, data: string): uint = "mac#"
fun
HttpClient_postAsynchronously_string
  (url: string, data: string): uint = "mac#"
//
(* ****** ****** *)
//
fun
HttpClient_setHeader_string (header: string): void = "mac#"
//
(* ****** ****** *)

(* end of [HttpClient.sats] *)
