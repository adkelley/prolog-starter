/** <module> starter
 *
 *   @see <http://github.com/adkelley/prolog-starter
 *
 %   Replace these xx with your own
 */

:- module(_, [ starter/0
             , name_uppercase/2
             , name_lowercase_reverse/2
             , version/1
             ]).

:- include(starter(include/common)).

:- use_module(substarter, []).
:- use_module(util, []).

%%  version(?Version) is semidet.
%
%   True if version is a list representing the major, minor
%   and patch version numbers of this library.

version([0,0,1]).

%% starter/0 is det
%% starter(+Name, ?Uppercase) is semidet
%
%  Note: Replace these with your own main program
%

starter :-
    core:writeln("Hello, Starter!").

%% name_uppercase(+Name, -UpperCase)
%
% transform a Name string to UpperCase
%

name_uppercase(Name, UpperCase) :-
    core:var(UpperCase),
    !,
    core:string_upper(Name, UpperCase).

name_uppercase(_Name, _Uppercase) :-
    util:throw_error(instantiation, name_uppercase/2, "UpperCase argument must be a free variable").

%% name_lowercase_reverse(Name, LowerReverse)
%
%  convert Name to lowercase and reverse it
%
name_lowercase_reverse(Name, LowerCaseReversed) :-
    core:var(LowerCaseReversed),
    !,
    substarter:name_lowercase(Name, LowerCase),
    core:string_chars(LowerCase, LowerCaseList),
    core:reverse(LowerCaseList, ReversedList),
    core:text_to_string(ReversedList, LowerCaseReversed).

name_lowercase_reverse(_Name, _LowerCaseReversed) :-
    util:throw_error(instantiation, name_lowercase_reverse/2, "LowerCaseReversed argument must be a free variable").
