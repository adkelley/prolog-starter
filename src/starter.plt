:- include(starter(include/common)).

:- begin_tests('starter:starter/2').

test('verify library version', [true(Got == Expected)]) :-
    Expected = [0, 0, 1],
    starter:version(Got).

test('Starter word transformed to upper case', true(Got == Expected)) :-
    Expected = "STARTER",
    starter:starter("Starter", Got).

:- end_tests('starter:starter/1').
