:- module(_, [name_lowercase/2]).

%% name_lower(+Name, -LowerCase)
%
% transform Name string to lower case
%
name_lowercase(Name, LowerCase) :-
    core:var(LowerCase),
    !,
    core:string_lower(Name, LowerCase).
