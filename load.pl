/** <module> Interface for Prolog starter template.

Acts as an interface to the system. Configures load paths and provides
predicates for initiating the system.

To configure for your own project, replace 'starter', with the name
of your main program file.

Configures internal load paths in preparation of use_module calls.
Provides predicates for adding an entity to the current database

@author Fixme
@copyright Fixme
@license Fixme
*/

starter_configure_globals :-
    set_test_options([load(always)]).


% starter_configure_load_paths() is det
%
% Configures internal load paths in preparation of use_module calls.

starter_configure_load_paths :-
    prolog_load_context(directory, Root), % Available during compilation
    starter_configure_path(Root, 'src', starter).

starter_configure_path(PathPrefix, PathSuffix, Name) :-
    atomic_list_concat([PathPrefix,PathSuffix], '/', Path),
    asserta(user:file_search_path(Name, Path)).

% Set everything up
:- starter_configure_globals.
:- starter_configure_load_paths.

% documentation - uncomment to run documentation server
%:- doc_server(4000).
%:- portray_text(true).


:- include(starter(include/common)).

starter_load_project_modules :-
    %% TODO: Look into pldoc
    use_module(library(pldoc), []),  % Load first to enable comment processing
    use_module(starter(starter), []),
    use_module(starter(substarter), []).

starter_load_project_tests :-
    plunit:load_test_files([]).

%% starter_test() is det.
%
%  Loads everything and runs test suite

starter_test :-
    starter_load_project_modules,
    starter_load_project_tests,
    starter_run_test_suite.

starter_run_test_suite :-
    core:format('~n% Run tests ...~n'),
    plunit:run_tests.

%%  starter_cov() is det.
%
%   Loads everything and runs the test suite with coverage analysis.

starter_cov :-
    starter_load_project_modules,
    starter_load_project_tests,
    starter_run_test_suite_with_coverage.

starter_run_test_suite_with_coverage :-
    core:format('~n% Run tests ...~n'),
    plunit:show_coverage(plunit:run_tests).

%% starter_repl() is det.
%
%  Loads everything and enters interactive mode.

starter_repl :-
    starter_load_project_modules,
    starter_load_project_tests.


%% starter_args() is det.
%
%  Loads everything and executes a goal entered by the user from the command line.
%  Format of command line args is Module Name ExtraArgs, where Name is the
%  predicate you wish to run.  See Makefile
%
starter_args :-
    starter_load_project_modules,
    core:current_prolog_flag(argv, [M,Name|ExtraArgs]),
    format('Goal: ~w:~w~n', [M,Name]),
    go(M:Name, ExtraArgs).

go(_,[]).
go(M:Name, [Arg|Args]) :-
    core:apply(M:Name, [Arg, Result]),
    core:format('Argument: ~w, Result: ~w~n', [Arg,Result]),
    go(M:Name, Args).
