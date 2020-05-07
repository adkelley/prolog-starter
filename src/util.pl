/** <module> Common Utility predicates

This is an example structure for modular software development in Prolog.

@author Fixme
@copyright Fixme
@license Fixme
@see <http://github.com/adkelley/prolog-starter

*/

:- module(_, [ throw_error/3 ]).


%! throw_error(+Type, +Predicate, +Message) is semidet
%
%  Throw an error and report the predicate and message
%  to the user
%
throw_error(Type, Predicate, Message) :-
    throw(starter_error(Type, context(Predicate, Message))).
