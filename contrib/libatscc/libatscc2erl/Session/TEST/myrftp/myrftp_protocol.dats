(*
** protocal for myftp
*)

(* ****** ****** *)

#define ATS_DYNLOADFLAG 0

(* ****** ****** *)

abstype ssftp // HX: a placeholder

(* ****** ****** *)
//
datavtype
channeg_ssftp(type) =
//
| channeg_ssftp_ls0(ssftp_ls0) of ()
| channeg_ssftp_ls1(ssftp_ls1) of (string)
//
| channeg_ssftp_cd1(ssftp_cd1) of (string)
//
| channeg_ssftp_get1(ssftp_get1) of (string)
//
(*
| channeg_ssftp_put(ssftp_put) of (string)
*)
//
| channeg_ssftp_quit0(chnil) of ((*void*))
//
where
ssftp_ls0 = chrcv(ERLval)::ssdisj(ssftp)
and
ssftp_ls1 = chrcv(ERLval)::ssdisj(ssftp)
and
ssftp_cd1 = chrcv(ERLval)::ssdisj(ssftp)
and
ssftp_get1 = chrcv(ERLval)::ssdisj(ssftp)
(*
and
ssftp_put = chrcv(ERLval)::ssdisj(ssftp)
*)
and
ssftp_quit0 = chnil // HX: session terminated
//
(* ****** ****** *)
//
extern
fun
channeg_ssftp
(
  !channeg(ssdisj(ssftp)) >> channeg(ss)
) : #[ss:type] channeg_ssftp(ss) = "mac#"
//
implement
channeg_ssftp(chp) = let
//
extern
prfun
__assert
(
  chp: !channeg(ssdisj(ssftp)) >> channeg(chsnd(channeg_ssftp(ss))::ss)
) : #[ss:type] void
//
prval () = __assert(chp)
//
in
  channel_recv(chp)
end // end of [channeg_ssftp]
//
(* ****** ****** *)
//
extern
fun
chanpos_ssftp_ls0
  (!chanpos(ssdisj(ssftp)) >> chanpos(ssftp_ls0)): void = "mac#"
//
extern
fun
chanpos_ssftp_ls1
  (!chanpos(ssdisj(ssftp)) >> chanpos(ssftp_ls1), Dir: string): void = "mac#"
//
extern
fun
chanpos_ssftp_cd1
  (!chanpos(ssdisj(ssftp)) >> chanpos(ssftp_cd1), Dir: string): void = "mac#"
//
extern
fun
chanpos_ssftp_get1
  (!chanpos(ssdisj(ssftp)) >> chanpos(ssftp_get1), Filename: string): void = "mac#"
//
and
chanpos_ssftp_quit0
  (!chanpos(ssdisj(ssftp)) >> chanpos(ssftp_quit0)): void = "mac#"
//
(* ****** ****** *)

implement
chanpos_ssftp_ls0
  (chp) = let
//
extern
prfun
__assert
(
chp:
!chanpos(ssdisj(ssftp)) >>
 chanpos(chsnd(channeg_ssftp(ssftp_ls0))::ssftp_ls0)
) : void
//
prval () = __assert(chp)
//
in
  channel_send(chp, channeg_ssftp_ls0())
end // end of [chanpos_ssftp_ls0]

implement
chanpos_ssftp_ls1
  (chp, Dir) = let
//
extern
prfun
__assert
(
chp:
!chanpos(ssdisj(ssftp)) >>
 chanpos(chsnd(channeg_ssftp(ssftp_ls1))::ssftp_ls1)
) : void
//
prval () = __assert(chp)
//
in
  channel_send(chp, channeg_ssftp_ls1(Dir))
end // end of [chanpos_ssftp_ls1]

implement
chanpos_ssftp_cd1
  (chp, Dir) = let
//
extern
prfun
__assert
(
chp:
!chanpos(ssdisj(ssftp)) >>
 chanpos(chsnd(channeg_ssftp(ssftp_cd1))::ssftp_cd1)
) : void
//
prval () = __assert(chp)
//
in
  channel_send(chp, channeg_ssftp_cd1(Dir))
end // end of [chanpos_ssftp_cd1]

implement
chanpos_ssftp_get1
  (chp, Filename) = let
//
extern
prfun
__assert
(
chp:
!chanpos(ssdisj(ssftp)) >>
 chanpos(chsnd(channeg_ssftp(ssftp_get1))::ssftp_get1)
) : void
//
prval () = __assert(chp)
//
in
  channel_send(chp, channeg_ssftp_get1(Filename))
end // end of [chanpos_ssftp_get1]

implement
chanpos_ssftp_quit0
  (chp) = let
//
extern
prfun
__assert
(
chp:
!chanpos(ssdisj(ssftp)) >>
 chanpos(chsnd(channeg_ssftp(ssftp_quit0))::ssftp_quit0)
) : void
//
prval () = __assert(chp)
//
in
  channel_send(chp, channeg_ssftp_quit0())
end // end of [chanpos_ssftp_quit]

(* ****** ****** *)
//
macdef SERVICE_MYRFTP = $extval(atom, "'SERVICE_MYRFTP'")
//
(* ****** ****** *)

(* end of [myrftp_protocol.dats] *)
