:- include(starter(include/common)).

:- begin_tests('substarter unit tests').

test('name_lowercase: Name transformed to lower case', true(Got == Expected)) :-
    Expected = "substarter",
    substarter:name_lowercase("SUBSTARTER", Got).

:- end_tests('substarter unit tests').
