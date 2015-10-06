%%%-------------------------------------------------------------------
%%% @author badu
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 06. Oct 2015 7:59 AM
%%%-------------------------------------------------------------------
-module(nth_prime_number).
-author("badu").
-include("../include/headers.hrl").
%% API
-export([run_tests/0]).

%% https://projecteuler.net/problem=7
%%
%% By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
%%
%% What is the 10 001st prime number?

is_prime(N) when N<2 -> false;
is_prime(2)-> true;
is_prime(3)->true;
is_prime(N) when N rem 2 == 0 -> false;
is_prime(N)->
  is_prime(N, 3).

is_prime(N, Div)->
  case math:sqrt(N) >= Div of
    true->
      case N rem Div of
        0 ->
          false;
        _ ->
          is_prime(N, Div+2)
      end;
    _ ->
      true
  end.


first_n_primes(N)->
  next_prime(1,[], N).

next_prime(Start,Acc, N) when N > length(Acc)->
  case is_prime(Start+1) of
    true->
      next_prime(Start+1, [Start+1 | Acc], N);
    _ ->
      next_prime(Start+1, Acc, N)
  end;
next_prime(_Start,Acc, _N)->
  Acc.

run_tests()->
  ?PRINT("Primes: ~p",[lists:reverse(first_n_primes(10001))]).

