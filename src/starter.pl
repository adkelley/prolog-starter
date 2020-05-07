/** <module> Prolog starter template main module

This is an example structure for modular software development in Prolog.

@author Fixme
@copyright Fixme
@license Fixme
@see <http://github.com/adkelley/prolog-starter
*/

:- module(_, [ starter/0
             , string_uppercase/2
             , string_lowercase_reverse/2
             , version/1
             ]).

:- include(starter(include/common)).

:- use_module(substarter, []).
:- use_module(util, []).

%!  version(?Version) is det.
%
%   True if version is a list representing the major, minor
%   and patch version numbers of this library.

version([0,0,1]).

%! starter is det
%
%  Replace these modules with your own main program
%

starter :-
    core:writeln("Hello, Starter!").

%! string_uppercase(+String, -UpperCase) is semidet
%
% Transform a String string to UpperCase
%

string_uppercase(String, UpperCase) :-
    core:var(UpperCase),
    !,
    core:string_upper(String, UpperCase).

string_uppercase(_String, _Uppercase) :-
    util:throw_error(instantiation, starter:string_uppercase/2, "UpperCase argument must be a free variable").

%! string_lowercase_reverse(String, LowerReverse) is semidet
%
%  convert String to lowercase and reverse it
%
string_lowercase_reverse(String, LowerCaseReversed) :-
    core:var(LowerCaseReversed),
    !,
    substarter:string_lowercase(String, LowerCase),
    core:string_chars(LowerCase, LowerCaseList),
    core:reverse(LowerCaseList, ReversedList),
    core:text_to_string(ReversedList, LowerCaseReversed).

string_lowercase_reverse(_String, _LowerCaseReversed) :-
    util:throw_error(instantiation, starter:string_lowercase_reverse/2, "LowerCaseReversed argument must be a free variable").
