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
abstype
HttpClient_ptr =
$extype"HttpClient_ptr"

(* ****** ****** *)
//
fun
HttpClient(): HttpClient_ptr = "mac#"
//
(* ****** ****** *)
//
fun
HttpClient_ready(HttpClient_ptr): bool = "mac#"
//
(* ****** ****** *)
//
fun
HttpClient_available(HttpClient_ptr): int = "mac#"
//
(* ****** ****** *)
//
fun
HttpClient_getResult(HttpClient_ptr): uint = "mac#"
//
fun
HttpClient_checkSSL(HttpClient_ptr): void = "mac#"
fun
HttpClient_noCheckSSL(HttpClient_ptr): void = "mac#"
//
(* ****** ****** *)
//
overload .ready with HttpClient_ready
//
overload .available with HttpClient_available
//
overload .getResult with HttpClient_getResult
//
overload .checkSSL with HttpClient_checkSSL
overload .noCheckSSL with HttpClient_noCheckSSL
//
(* ****** ****** *)
//
fun
HttpClient_get_string
  (HttpClient_ptr, url: string): uint = "mac#"
fun
HttpClient_getAsynchronously_string
  (HttpClient_ptr, url: string): uint = "mac#"
//
overload .get with HttpClient_get_string
overload .getAsynchronously with HttpClient_getAsynchronously_string
//
(* ****** ****** *)
//
fun
HttpClient_post_string
  (HttpClient_ptr, url: string, data: string): uint = "mac#"
fun
HttpClient_postAsynchronously_string
  (HttpClient_ptr, url: string, data: string): void = "mac#"
//
overload .post with HttpClient_post_string
overload .postAsynchronously with HttpClient_postAsynchronously_string
//
(* ****** ****** *)
//
fun
HttpClient_setHeader_string
  (HttpClient_ptr, header: string): void = "mac#"
//
overload .setHeader with HttpClient_setHeader_string
//
(* ****** ****** *)

(* end of [HttpClient.sats] *)
