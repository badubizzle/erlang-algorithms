%%%-------------------------------------------------------------------
%%% @author badu
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 06. Oct 2015 7:16 AM
%%%-------------------------------------------------------------------
-module(largest_palindrome_products).
-author("badu").
-include("../include/headers.hrl").

%% API
-export([run_tests/0]).

%% A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
%%
%% Find the largest palindrome made from the product of two 3-digit numbers.

% the biggest possible products of two 3-digit numbers is 999*999
% palindrome reads the same from left to right or right to left

largest_palindrome_below(N) when is_integer(N)->
  Reverse = lists:reverse(integer_to_list(N)),
  L = integer_to_list(N),
  case L == Reverse of
    true->
      N;
    _ ->
      largest_palindrome_below(N-1)
  end.

run_tests()->
  ?PRINT ("LARGEST PALINDROME: ~p",[largest_palindrome_below(999*999)]),
  ok.
