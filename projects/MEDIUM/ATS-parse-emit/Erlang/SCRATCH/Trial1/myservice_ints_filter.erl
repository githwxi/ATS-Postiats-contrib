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
    Chpos = spawn(session, chpos_transfer, []),
    Chneg = spawn(?MODULE, myservice_ints_filter_fserv, [Chpos]),
    Client ! {myservice_ints_filter, {Chpos, Chneg}},
    myservice_ints_filter()
  end.

%%%%%%

myservice_ints_filter_fserv(Chpos) ->
  %% io:format("myservice_ints_filter_fserv: Chpos = ~p~n", [Chpos]),
  Ints = session:chpos_recv(Chpos),
  Opt2 = session:chpos_sslist(Chpos),
  %% io:format("myservice_ints_filter_fserv: Ints = ~p~n", [Ints]),
  %% io:format("myservice_ints_filter_fserv: Opt2 = ~p~n", [Opt2]),
  case Opt2 of
    nil ->
      session:chneg_sslist_nil(Ints);
    cons ->
      session:chneg_sslist_cons(Ints),
      First = session:chneg_send(Ints),
      session:chpos_send(Chpos, First),
      myservice_ints_filter_fserv2(First, Ints, Chpos)
  end.
	    
myservice_ints_filter_fserv2(P, Ints, Chpos) ->
  Opt2 = session:chpos_sslist (Chpos),
  case Opt2 of
    nil ->
      session:chneg_sslist_nil(Ints),
      session:chpos_recv_close(Chpos);
    cons ->
      Next = myservice_ints_filter_fserv2_next(P, Ints, Chpos),
      session:chpos_send(Chpos, Next),	  
      myservice_ints_filter_fserv2(P, Ints, Chpos)
  end.

myservice_ints_filter_fserv2_next(P, Ints, Chpos) ->
  session:chneg_sslist_cons(Ints),
  Next = session:chneg_send(Ints),
  if
    Next rem P > 0 -> Next;
    true -> myservice_ints_filter_fserv2_next(P, Ints, Chpos)
  end.

%%%%%%

%%%%%% end of [myservice_ints_filter.erl] ######
