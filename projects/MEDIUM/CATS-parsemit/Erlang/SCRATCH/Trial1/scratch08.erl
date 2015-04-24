%%%%%%
%
-module(scratch08).
-export([scratch08_init/0]).
-export([scratch08_test0/1]).
-export([scratch08_test1/1]).
-export([scratch08_test2/2]).
%
-export([succ_bits/1]).
-export([succ_bits_fserv/2]).
%
-export([add_bits_bits/2]).
-export([add_bits_bits_fserv/3]).
%
%%%%%%

scratch08_init() ->
  register(myservice_int2bits, spawn(myservice_int2bits, myservice_int2bits, [])).

%%%%%%

scratch08_test0(N) ->
  myservice_int2bits ! self(),
  Int2bits =
    receive {myservice_int2bits, Chposneg} -> Chposneg end,
  session:chneg_recv(Int2bits, N), bitlst_show_loop(Int2bits, 0).

%%%%%%

bitlst_show_loop(Bitlst, I) ->
  Opt = session:chneg_send(Bitlst),
  case Opt of
    nil ->
      session:chneg_recv_close(Bitlst);
    cons ->
      Bit = session:chneg_send(Bitlst),
      io:format("Bit[~p] = ~p~n", [I, Bit]),
      bitlst_show_loop(Bitlst, I+1)
  end.

%%%%%%

bitlst2int(Bitlst) ->
  Opt = session:chneg_send(Bitlst),
  case Opt of
      nil ->
	  session:chneg_recv_close(Bitlst), 0;
      cons ->
	  Bit = session:chneg_send(Bitlst), 2*bitlst2int(Bitlst)+Bit
  end.

%%%%%%

scratch08_test1(N) ->
  myservice_int2bits ! self(),
  Bitlst =
    receive {myservice_int2bits, Chposneg1} -> Chposneg1 end,
  session:chneg_recv(Bitlst, N),
  bitlst2int(succ_bits(Bitlst)).

%%%%%%

scratch08_test2(N1, N2) ->
  myservice_int2bits ! self(),
  Bitlst1 =
    receive {myservice_int2bits, Chposneg1} -> Chposneg1 end,
  myservice_int2bits ! self(),
  Bitlst2 =
    receive {myservice_int2bits, Chposneg2} -> Chposneg2 end,
  session:chneg_recv(Bitlst1, N1),
  session:chneg_recv(Bitlst2, N2),
  bitlst2int(add_bits_bits(Bitlst1, Bitlst2)).

%%%%%%

succ_bits(Bitlst) ->
  Chpos = spawn(session, chpos_transfer, []),
  Chneg = spawn(?MODULE, succ_bits_fserv, [Chpos, Bitlst]),
  {Chpos, Chneg}.

succ_bits_fserv(Chpos, Bitlst) ->
  Opt = session:chneg_sslist(Bitlst),
  case Opt of
    nil ->
      session:chneg_recv_close(Bitlst),
      session:chpos_sslist_cons(Chpos),
      session:chpos_send(Chpos, 1),
      session:chpos_sslist_nil(Chpos),
      session:chpos_recv_close(Chpos);
    cons ->
      session:chpos_sslist_cons(Chpos),
      Bit = session:chneg_send(Bitlst),
      case Bit of
        0 ->
          session:chpos_send(Chpos, 1),
	  session:chpos_chneg_connect(Chpos, Bitlst);
	1 ->
          session:chpos_send(Chpos, 0),	     
          succ_bits_fserv(Chpos, Bitlst)
      end
  end.

%%%%%%

add_bits_bits
  (Bits1, Bits2) ->
  Chpos = spawn(session, chpos_transfer, []),
  Chneg = spawn(?MODULE, add_bits_bits_fserv, [Chpos, Bits1, Bits2]),
  {Chpos, Chneg}.

add_bits_bits_fserv
  (Chpos, Bits1, Bits2) ->
  Opt1 = session:chneg_sslist(Bits1),
  case Opt1 of
    nil ->
      session:chneg_recv_close(Bits1),
      session:chpos_chneg_connect(Chpos, Bits2);
    cons ->
      session:chpos_sslist_cons(Chpos),
      Opt2 = session:chneg_sslist(Bits2),
      case Opt2 of
        nil ->
          session:chneg_recv_close(Bits2),
          session:chpos_chneg_connect(Chpos, Bits1);
        cons ->
          B1 = session:chneg_send(Bits1),
          B2 = session:chneg_send(Bits2),
          case B1 of
            0 -> session:chpos_send(Chpos, B2), add_bits_bits_fserv(Chpos, Bits1, Bits2);
            1 ->
              case B2 of
                0 -> session:chpos_send(Chpos, 1), add_bits_bits_fserv(Chpos, Bits1, Bits2);
                1 -> session:chpos_send(Chpos, 0), add_bits_bits_fserv(Chpos, Bits1, succ_bits(Bits2))
              end
          end
      end
  end.

%%%%%%

%%%%%% end of [scratch08.erl] %%%%%%
