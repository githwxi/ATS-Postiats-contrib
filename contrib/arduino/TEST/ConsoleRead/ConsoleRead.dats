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

%{^
typedef char *charptr;
%} // end of [%{^]
abstype charptr = $extype"charptr"

(* ****** ****** *)

%{^
#define ATS_MFREE free
#define ATS_MALLOC malloc
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
  val () = while (~Console_ptr.connected()) ()
  val () = Console_ptr.println ("Hi, what's your name?")
}
//
(* ****** ****** *)

extern
fun loop (): void = "mac#"
implement loop () = while (true) ( delay(250) )

(* ****** ****** *)

(* end of [ConsoleRead.dats] *)
////

void loop() {
  if (Console.available() > 0) {
    char c = Console.read(); // read the next char received
    // look for the newline character, this is the last character in the string
    if (c == '\n') {
      //print text with the name received
      Console.print("Hi ");
      Console.print(name);
      Console.println("! Nice to meet you!");
      Console.println();
      // Ask again for name and clear the old name
      Console.println("Hi, what's your name?");
      name = "";  // clear the name string
    } else {
    // if the buffer is empty Cosole.read() returns -1
    name += c; // append the read char from Console to the name string
  }
  } else {
    delay(100);
  }
}
                                                                                                    