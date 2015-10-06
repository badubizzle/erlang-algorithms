%%%-------------------------------------------------------------------
%%% @author badu
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 06. Oct 2015 6:41 AM
%%%-------------------------------------------------------------------
-module(largest_prim_factor).
-author("badu").
-include("../include/headers.hrl").
%% API
-export([find_prime_factors/1, run_tests/0, largest_prime_factor/1]).


% The prime factors of 13195 are 5, 7, 13 and 29.
% What is the largest prime factor of the number 600851475143 ?

%% pseudo code
%%
%% start with divider =2
%% while(num modulo 2 ==0)
%%   add 2 to factors list,
%%   num becomes num / 2
%%
%% then we start with 3, and other subsequent odd numbers since 2 has taken care of
%% all even number
%% divider = 3
%% while divider < square root of num
%%   while num modulo divider ==0 and
%%     add divider to factors list
%%     num becomes num /divider
%%   increment divider by 2 for next odd number
%%
%% if num is greater than 1
%%   add num to factors list



find_primes_for_2(N, Acc)->
  case N rem 2 of
    0 ->
      find_primes_for_2(N div 2, [2 | Acc]);
    _ ->
      {N, Acc}
  end.

find_primes_for_3_above(Divider,N, Acc)->
  case Divider < math:sqrt(N) of
    true->
      case N rem Divider of
        0->
          find_primes_for_3_above(Divider, N div Divider, [Divider | Acc]);
        _ ->
          find_primes_for_3_above(Divider+1, N, Acc)
      end;
    _ ->
      {N, Acc}
  end.


find_prime_factors(N)->
  {N1, Acc1}=find_primes_for_2(N, []),
  {N2, Acc2}=find_primes_for_3_above(3, N1, Acc1),
  Factors = case N2 == 1 of
    true->
        Acc2;
    _ ->
      [N2 | Acc2]
  end,
  ?PRINT("Prime Factors: ~p~n",[Factors]),
  Factors.

largest_prime_factor(N)->
  lists:nth(1, find_prime_factors(N)).

run_tests()->
  ?PRINT("Largest prime factor: ~p~n",[largest_prime_factor(10)]),
%%   largest_prime_factor(13195),
ok.