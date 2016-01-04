%%%%%%

-module(myrftpd_stop).
-export([main0_erl/0]).

%%%%%%

main0_erl() -> rpc:call('myrftpd@localhost', init, stop, []).

%%%%%% end of [myrftpd_stop] %%%%%%
