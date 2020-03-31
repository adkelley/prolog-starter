/** <module> Common Utility predicates
*/

:- module(_, [ throw_error/3 ]).


throw_error(Type, Predicate, Message) :-
    throw(starter_error(Type, context(Predicate, Message))).
