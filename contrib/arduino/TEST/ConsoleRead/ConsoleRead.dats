(*
#
# ConsoleRead
#
*)
(* ****** ****** *)

#define ATS_DYNLOADFLAG 0

(* ****** ****** *)
//
#include
"share/atspre_define.hats"
#include
"{$ARDUINO}/staloadall.hats"
//
(* ****** ****** *)

staload UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)

staload _ = "prelude/DATS/list.dats"
staload _ = "prelude/DATS/list_vt.dats"

(* ****** ****** *)

%{^
typedef char *charptr;
%} // end of [%{^]
abstype charptr = $extype"charptr"

(* ****** ****** *)

%{^
#define ATS_MFREE free
#define ATS_MALLOC malloc
#define ATSextfcall(fun, funarg) fun funarg
#define ATSextmcall(obj, mtd, funarg) obj.mtd funarg
%} // end of [%{^]

(* ****** ****** *)

staload "{$ARDUINO}/SATS/Bridge/Bridge.sats"
staload "{$ARDUINO}/SATS/Bridge/Console.sats"

(* ****** ****** *)
//
extern
fun
setup (): void = "mac#"
//
implement
setup () =
{
  val () = Bridge_ptr._begin()
  val () = Console_ptr._begin()
//
  val () = while(~Console_ptr.connected()) ()
//
} (* end of [setup] *)
//
(* ****** ****** *)
//
vtypedef
charlst = List0_vt(char)
//
extern
fun
myloop (cs: charlst): void
extern
fun
myloop_respond (cs: charlst): void
//
(* ****** ****** *)
//
extern
fun
loop (): void = "mac#"
implement
loop () =
{
  val () = delay(1000)
  val () = Console_ptr.println("Amigo, what's your name?");
  val () = myloop (list_vt_nil)
}
//
(* ****** ****** *)

macdef EOL = char2int0('\n')

implement
myloop (cs) = let
//
val
test =
Console_ptr.available()
//
in
//
if
test > 0
then let
  val c = Console_ptr.read()
in
  if c = EOL
    then myloop_respond(cs)
    else myloop (cons_vt(int2char0(c), cs))
  // end of [if]
end // end of [then]
else let
  val () = delay (1000) in myloop (cs)
end (* end of [else] *)
//
end // end of [myloop]

(* ****** ****** *)

fun
myprint_charlst
  (cs: charlst): void = let
in
//
case+ cs of
| ~list_vt_nil () => ()
| ~list_vt_cons (c, cs) =>
  (
    Console_ptr.print(c); myprint_charlst(cs)
  ) (* end of [list_vt_cons] *)
//
end // end of [myprint_charlst]

(* ****** ****** *)

implement
myloop_respond (cs) =
{
  val () =
    Console_ptr.print("Hi, ")
  // end of [val]
  val cs = list_vt_reverse(cs)
  val () = myprint_charlst(cs)
  val () = Console_ptr.println("! Nice to meet you!")
  val () = Console_ptr.println()
} (* end of [myloop_respond] *)

(* ****** ****** *)

(* end of [ConsoleRead.dats] *)
