%%%-------------------------------------------------------------------
%%% @author badu
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 06. Oct 2015 6:16 AM
%%%-------------------------------------------------------------------
-module(smallest_multiple).
-author("badu").
-include("../include/headers.hrl").
%% API
-export([smallest_multiple/1, run_tests/0]).

%https://projecteuler.net/problem=5

%2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
% What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

%NOTE: smallest positive number that is evenly divisible by all numbers in a set of number is same as smallest multiple of all
%numbers in the set

%% smallest multiple for a given set of numbers
%% can be found by running a reduce function on lcm of two adjacent numbers
%% given 1, 2, 3 smallest multiple will be lcm(lcm(1, 2),3)
%% lcm(1,2) =2, lcm(2,3) = 6 i.e smallest multiple of

gcd(A, B) when is_integer(A), is_integer(B), B == 0->
  A;
gcd(A, B) when is_integer(A), is_integer(B)->
  gcd(B, A rem B).

lcm(A, B)->
  A*B div gcd(A, B).

smallest_multiple(I, Acc, N) when I<N->
  Total = lcm(Acc, I),
  smallest_multiple(I+1,Total, N);
smallest_multiple(_I, Acc, _N)->
  Acc.
%smallest mulple for all numbers starting from 1..N
smallest_multiple(N) when N>0->
  smallest_multiple(1, 1, N).


run_tests()->
  ?PRINT("Smallest multiple range(1, 10) = ~p~n", [smallest_multiple(10)]).