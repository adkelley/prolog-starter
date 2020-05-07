:- include(starter(include/common)).

:- use_module(substarter, []).

:- begin_tests('substarter').

test('test1', true(Got == Expected)) :-
    format('~nsubstarter:test1 - string_lowercase/2: string transformed to lower case~n'),
    Expected = "substarter",
    substarter:string_lowercase("SUBSTARTER", Got).

test('test2', [
         throws(starter_error(instantiation, context(substarter:string_lowercase/2, "LowerCase argument must be a free variable")))]) :-
    format('~nsubstarter:test2 - string_lowercase/2: throws on a bounded var'),
    Var = "bounded already",
    substarter:string_lowercase("SUBSTARTER", Var).

:- end_tests('substarter').
