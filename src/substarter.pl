/** <module> Prolog starter template substarter module

This is an example structure for modular software development in Prolog.

@author Fixme
@copyright Fixme
@license Fixme
@see <http://github.com/adkelley/prolog-starter
*/

:- module(_, [string_lowercase/2]).

:- use_module(util, []).

%! string_lowercase(+String, -LowerCase) is semidet
%
% Transform string to lower case
%
string_lowercase(Word, LowerCase) :-
    core:var(LowerCase),
    !,
    core:string_lower(Word, LowerCase).

string_lowercase(_Name, _LowerCase) :-
    util:throw_error(instantiation, substarter:string_lowercase/2, "LowerCase argument must be a free variable").
