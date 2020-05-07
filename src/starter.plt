:- include(starter(include/common)).

:- use_module(starter, []).

:- begin_tests('starter').

test('test1', [true(Got == Expected)]) :-
    format('~nstarter:test1 - library version~n'),
    Expected = [0, 0, 1],
    starter:version(Got).

test('test2A', true(Got == Expected)) :-
    format('~nstarter:test2A - string_uppercase/2: name transformed to upper case~n'),
    Expected = "STARTER",
    starter:string_uppercase("starter", Got).

test('test2B', [
         throws(starter_error(instantiation, context(starter:string_uppercase/2, "UpperCase argument must be a free variable")))]) :-
    format('~nstarter:test2B - string_uppercase/2: throws on a bounded argument~n'),
    Var = "bounded already",
    starter:string_uppercase("starter", Var).

test('test3A', true(Got == Expected)) :-
    format('~nstarter:test3A - string_lowercase_reverse/2: name transformed to lower case and reversed~n'),
    Expected = "retrats",
    starter:string_lowercase_reverse("STARTER", Got).

test('test3B', [
         throws(starter_error(instantiation, context(starter:string_lowercase_reverse/2, "LowerCaseReversed argument must be a free variable")))]) :-
    format('~nstarter:test3B - string_lowercase_reverse/2: throws on a bounded argument~n'),
    Var = "bounded already",
    starter:string_lowercase_reverse("STARTER", Var).


:- end_tests('starter').
