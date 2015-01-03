%%%%%%
%
-module(myservice_ints_filter).
%
-export([myservice_ints_filter/0]).
-export([myservice_ints_filter_fserv/1]).
%
%%%%%%

myservice_ints_filter() ->
  receive
    Client ->
    Chneg = spawn(session, chneg_transfer, []),
    Chpos = spawn(?MODULE, myservice_ints_filter_fserv, [Chneg]),
    Client ! {myservice_ints_filter, {Chpos, Chneg}},
    myservice_ints_filter()
  end.

%%%%%%

myservice_ints_filter_fserv(Chneg) ->
  %% io:format("myservice_ints_filter_fserv: Chneg = ~p~n", [Chneg]),
  Ints = session:chpos_recv(Chneg),
  Opt2 = session:chpos_sslist(Chneg),
  %% io:format("myservice_ints_filter_fserv: Ints = ~p~n", [Ints]),
  %% io:format("myservice_ints_filter_fserv: Opt2 = ~p~n", [Opt2]),
  case Opt2 of
    nil ->
      Chneg ! chneg_transfer_close,
      session:chneg_sslist_nil(Ints);
    cons ->
      session:chneg_sslist_cons(Ints),
      First = session:chneg_send(Ints),
      session:chpos_send(Chneg, First),
      myservice_ints_filter_fserv2(First, Ints, Chneg)
  end.
	    
myservice_ints_filter_fserv2(P, Ints, Chneg) ->
  Opt2 = session:chpos_sslist (Chneg),
  case Opt2 of
    nil ->
      Chneg ! chneg_transfer_close,
      session:chneg_sslist_nil(Ints);
    cons ->
      Next = myservice_ints_filter_fserv2_next(P, Ints, Chneg),
      session:chpos_send(Chneg, Next),	  
      myservice_ints_filter_fserv2(P, Ints, Chneg)
  end.

myservice_ints_filter_fserv2_next(P, Ints, Chneg) ->
  session:chneg_sslist_cons(Ints),
  Next = session:chneg_send(Ints),
  if
    Next rem P > 0 -> Next;
    true -> myservice_ints_filter_fserv2_next(P, Ints, Chneg)
  end.

%%%%%% end of [myservice_ints.erl] ######
