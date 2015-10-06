%%%-------------------------------------------------------------------
%%% @author badu
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 06. Oct 2015 7:43 AM
%%%-------------------------------------------------------------------
-module(sum_square_difference).
-author("badu").

-include("../include/headers.hrl").
%% API
-export([run_tests/0]).

%% https://projecteuler.net/problem=6

%% The sum of the squares of the first ten natural numbers is,
%%
%% 12 + 22 + ... + 102 = 385
%% The square of the sum of the first ten natural numbers is,
%%
%% (1 + 2 + ... + 10)2 = 552 = 3025
%% Hence the difference between the sum of the squares of the first ten natural numbers
%% and the square of the sum is 3025 − 385 = 2640.
%%
%% Find the difference between the sum of the squares of the first one
%% hundred natural numbers and the square of the sum.

sum_of_squares(L) when is_list(L)->
  Sum = lists:foldl(fun(N, Acc)-> Acc + (N * N) end, 0, L),
  %?PRINT("Sum of squares: ~p ~p ~n", [L, Sum]),
  Sum.
square_of_sum(L) when is_list(L)->
  Sum = lists:foldl(fun(N, Acc)-> Acc + N end, 0, L),
  Square = Sum * Sum,
  %?PRINT("square of sum: ~p ~p ~n", [L, Square]),
  Square.

difference_between_sum_of_squares_and_square_of_sum(L) when is_list(L)->
  square_of_sum(L)-sum_of_squares(L);
difference_between_sum_of_squares_and_square_of_sum(N) when is_integer(N)->
  difference_between_sum_of_squares_and_square_of_sum(lists:seq(1, N)).

run_tests()->
  ?PRINT("Difference for 1..10: ~p~n",[difference_between_sum_of_squares_and_square_of_sum(10)]),
  ?PRINT("Difference for 1..100: ~p~n",[difference_between_sum_of_squares_and_square_of_sum(lists:seq(1,100))]),
  ok.