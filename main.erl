#!/Users/badu/erlang/17.5/bin/escript
%%! -pa ebin -Wall
%%%-------------------------------------------------------------------
%%% @author badu
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 06. Oct 2015 6:24 AM
%%%-------------------------------------------------------------------

main(_)->
  run_all().

run_all()->
  {ok, Files}=file:list_dir("./ebin"),
  L = length(".beam"),
  lists:foreach(fun(FileName)->
    run_module_tests(lists:split(length(FileName)-L, FileName)),
    io:fwrite("~n")
  end,
    Files).

run_module_tests({ModuleName, _}) ->
  apply(list_to_atom(ModuleName), run_tests, []),

%%   smallest_multiple:run_tests(),
%%   largest_prim_factor:run_tests(),
%%   even_fib_numbers:run_tests(),
  ok.