(* ****** ****** *)
//
staload
"./../../SATS/Worker/channel.sats"
//
(* ****** ****** *)
//
typedef
sstest1 =
chrcv(int) :: chsnd(bool) :: chnil(*close*)
//
typedef
sstest0 =
chrcv(int) :: chsnd(int) :: chsnd(int) :: sstest1
//
(* ****** ****** *)

(* end of [test_prot.sats] *)

