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
| channeg_ssftp_ls(ssftp_ls) of ()
//
| channeg_ssftp_cd(ssftp_cd) of (string)
//
| channeg_ssftp_get(ssftp_get) of (string)
//
(*
| channeg_ssftp_put(ssftp_put) of (string)
*)
//
| channeg_ssftp_quit(chnil) of ()
//
where
ssftp_ls = chrcv(ERLval)::ssdisj(ssftp)
and
ssftp_cd = chrcv(ERLval)::ssdisj(ssftp)
and
ssftp_get = chrcv(ERLval)::ssdisj(ssftp)
(*
and
ssftp_put = chrcv(ERLval)::ssdisj(ssftp)
*)
and
ssftp_quit = chnil
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
chanpos_ssftp_ls
  (!chanpos(ssdisj(ssftp)) >> chanpos(ssftp_ls)): void = "mac#"
//
extern
fun
chanpos_ssftp_cd
  (!chanpos(ssdisj(ssftp)) >> chanpos(ssftp_cd), Dir: string): void = "mac#"
//
extern
fun
chanpos_ssftp_get
  (!chanpos(ssdisj(ssftp)) >> chanpos(ssftp_cd), Filename: string): void = "mac#"
//
and
chanpos_ssftp_quit
  (!chanpos(ssdisj(ssftp)) >> chanpos(ssftp_quit)): void = "mac#"
//
(* ****** ****** *)

implement
chanpos_ssftp_ls
  (chp) = let
//
extern
prfun
__assert
(
chp:
!chanpos(ssdisj(ssftp)) >>
 chanpos(chsnd(channeg_ssftp(ssftp_ls))::ssftp_ls)
) : void
//
prval () = __assert(chp)
//
in
  channel_send(chp, channeg_ssftp_ls())
end // end of [chanpos_ssftp_ls]

implement
chanpos_ssftp_cd
  (chp, Dir) = let
//
extern
prfun
__assert
(
chp:
!chanpos(ssdisj(ssftp)) >>
 chanpos(chsnd(channeg_ssftp(ssftp_cd))::ssftp_cd)
) : void
//
prval () = __assert(chp)
//
in
  channel_send(chp, channeg_ssftp_cd(Dir))
end // end of [chanpos_ssftp_cd]

implement
chanpos_ssftp_get
  (chp, Filename) = let
//
extern
prfun
__assert
(
chp:
!chanpos(ssdisj(ssftp)) >>
 chanpos(chsnd(channeg_ssftp(ssftp_get))::ssftp_get)
) : void
//
prval () = __assert(chp)
//
in
  channel_send(chp, channeg_ssftp_get(Filename))
end // end of [chanpos_ssftp_get]

implement
chanpos_ssftp_quit
  (chp) = let
//
extern
prfun
__assert
(
chp:
!chanpos(ssdisj(ssftp)) >>
 chanpos(chsnd(channeg_ssftp(ssftp_quit))::ssftp_quit)
) : void
//
prval () = __assert(chp)
//
in
  channel_send(chp, channeg_ssftp_quit())
end // end of [chanpos_ssftp_quit]

(* ****** ****** *)
//
macdef SERVICE_MYRFTP = $extval(atom, "'SERVICE_MYRFTP'")
//
(* ****** ****** *)

(* end of [myrftp_protocol.dats] *)
