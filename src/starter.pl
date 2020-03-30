/** <module> starter
 *
 *   @see <http://github.com/adkelley/prolog-starter
 */

:- module(_, [ starter/0
             , starter/2
             , version/1
             ]).

:- include(starter(include/common)).

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
    writeln("Hello, Starter!").

starter(Name, UpperCase) :-
    string_upper(Name, UpperCase).
