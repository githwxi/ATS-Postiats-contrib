(* ****** ****** *)
//
// A stream-based
// implementation of the
// word guessing game of Hangman
//
(* ****** ****** *)
//
// Author: Hongwei Xi
// Authoremail: gmhwxi AT gmail DOT com
// Start Time: December 6, 2016
//
(* ****** ****** *)

#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"

(* ****** ****** *)

staload UN = $UNSAFE

(* ****** ****** *)

#include "./kbstream.dats"

(* ****** ****** *)
//
datatype
mychar =
| Shown of (char)
| Hidden of (char)
//
typedef
myword = list0(mychar)
//
(* ****** ****** *)
//
extern
fun
fprint_mychar : fprint_type(mychar)
extern
fun
fprint_myword : fprint_type(myword)
//
overload fprint with fprint_mychar
overload fprint with fprint_myword of 10
//
(* ****** ****** *)
//
extern
fun
eq_mychar_mychar
  : (mychar, mychar) -> bool
extern
fun
eq_myword_myword
  : (myword, myword) -> bool
//
overload = with eq_mychar_mychar
overload = with eq_myword_myword
//
implement
eq_mychar_mychar
  (x, y) =
(
case+
(x, y)
of // case+
| (Shown _,
   Shown _) => true
| (Hidden _,
   Hidden _) => true
| (_, _) => false
)
implement
eq_myword_myword
  (xs, ys) =
(
case+
(xs, ys)
of // case+
| (nil0(),
   nil0()) => true
| (cons0(x, xs),
   cons0(y, ys)) => (x = y) && (xs = ys)
| (_, _) => false
)
//
(* ****** ****** *)
//
implement
fprint_mychar(out, x) =
  case+ x of
  | Shown(c) => fprint(out, c)
  | Hidden(c) => fprint(out, '_')
//
(* ****** ****** *)
//
implement
fprint_myword(out, xs) =
  xs.foreach()(lam x => fprint(out, x))
//
(* ****** ****** *)
//
extern
fun
myword_update
  (xs: myword, c0: char): myword
//
(* ****** ****** *)
//
implement
myword_update
  (xs, c0) =
(
xs.map
(TYPE{mychar})
(
lam x =>
case+ x of
| Shown _ => x
| Hidden(c) => if c0 = c then Shown(c) else x
)
)
//
(* ****** ****** *)
//
extern
fun
myword_is_shown
  (xs: myword): bool
//
implement
myword_is_shown(xs) =
(
xs.forall()
(
lam x =>
case+ x of Shown _ => true | Hidden _ => false
)
)
//
(* ****** ****** *)
//
#define N 6
//
extern
fun
play_hangman(given: string): bool
//
(* ****** ****** *)

implement
play_hangman(given) = let
//
val cs =
string_explode(given)
val xs =
cs.map(TYPE{mychar})(lam c => Hidden(c))
//
val ks =
kbstream(stdin_ref, 60)
//
val xss =
stream_vt_scan_cloptr<myword><char>
  (ks, xs, lam(xs, c) => myword_update(xs, c))
//
fun
auxmain
(
  n: intGte(0)
, xs0: myword
, xss: stream_vt(myword)
) : bool =
(
if
(n > 0)
then
(
case+ !xss of
| ~stream_vt_nil
    () => false where
  {
    val () = println! ("Time is up!")
  }
| ~stream_vt_cons
    (xs, xss) => let
    val () =
      fprintln! (stdout_ref, xs)
    // end of [val]
    val solved = myword_is_shown(xs)
  in
    if solved
      then solved where
      {
        val () = ~xss
        val () = println! ("You solved it!")
      }
      else let
        val n1 =
        (
          if xs0 = xs then n-1 else n
        ) : intGte(0)
        val () =
        if n1 = 1 then
          println! ("You have only 1 chance left:")
        // end of [if]
        val () =
        if n1 >= 2 then
          println! ("You still have ", n1, " chances:")
        // end of [if]
      in
        auxmain(n1, xs, xss)
      end // end of [else]
  end // end of [stream_vt_cons]
) // end-of-then
else false where
{
  val () = ~xss
  val () = println! ("You failed to solve it!")
} (* end of [else] *)
)
//
val-
~stream_vt_cons
  (xs0, xss) = !xss
//
val () =
  fprintln! (stdout_ref, xs0)
//
val () =
  println! ("You are given ", N, " chances:")
//
in
  auxmain(N, xs0, xss)
end // end of [play_hangman]

(* ****** ****** *)

staload "libats/libc/SATS/signal.sats"

(* ****** ****** *)

implement
main0(argc, argv) = () where
{
//
var sigact: sigaction
val () =
ptr_nullize<sigaction>
  (__assert () | sigact) where
{
  extern prfun __assert (): is_nullable(sigaction)
} (* end of [val] *)
//
val mysighandler = lam (sgn: signum_t): void => ()
val () = sigact.sa_handler := sighandler(mysighandler)
//
val () = assertloc (sigaction_null (SIGALRM, sigact) = 0)
//
var given: string = "camouflage"
val ((*void*)) =
  if argc >= 2 then given := argv[1]
//
val _(*solved*) = play_hangman(given)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [hangman.dats] *)
