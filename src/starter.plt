:- include(starter(include/common)).

:- begin_tests('starter unit tests').

test('version: library version', [true(Got == Expected)]) :-
    Expected = [0, 0, 1],
    starter:version(Got).

test('name_uppercase: name transformed to upper case', true(Got == Expected)) :-
    Expected = "STARTER",
    starter:name_uppercase("starter", Got).

test('name_lowercase_reverse: name transformed to lower case and reversed', true(Got == Expected)) :-
    Expected = "retrats",
    starter:name_lowercase_reverse("STARTER", Got).

:- end_tests('starter unit tests').
