% Variation 1: Get exactly 2 gallons of water in the 4-gallon jug
% Initial state: (0,0) where the first value represents the 4-gallon jug and the second value represents the 3-gallon jug
% Final state: (2,_) where the first value is 2 gallons in the 4-gallon jug

% Define actions: fill, empty, pour
action(fill(4, _)).
action(fill(_, 3)).
action(empty(4, _)).
action(empty(_, 3)).
action(pour(From, To)) :-
    member(From, [4, 3]),
    member(To, [4, 3]).

% Define successor state based on action
next((A, B), (A1, B1), Action) :-
    action(Action),
    apply(Action, (A, B), (A1, B1)).

apply(fill(4, _), (_, B), (4, B)).
apply(fill(_, 3), (A, _), (A, 3)).
apply(empty(4, _), (_, B), (0, B)).
apply(empty(_, 3), (A, _), (A, 0)).
apply(pour(4, 3), (A, B), (A1, B1)) :-
    Diff is min(A, 3 - B),
    A1 is A - Diff,
    B1 is B + Diff.
apply(pour(3, 4), (A, B), (A1, B1)) :-
    Diff is min(B, 4 - A),
    A1 is A + Diff,
    B1 is B - Diff.

% Define the search predicate using depth-first search
search(State, _, []) :- goal(State).
search(State, Visited, [Action | Actions]) :-
    next(State, NextState, Action),
    \+ member(NextState, Visited),
    search(NextState, [NextState | Visited], Actions).

% Define the goal state
goal((2, _)).

% Variation 2: Defuse a bomb by placing exactly 4 gallons of water on a sensor
% Variation 3: Deliver exactly 6 litres of milk using 8 and 5 litre jugs

% You can reuse the same predicates and just update the capacities and goals accordingly

% Example usage:
% ?- search((0, 0), [(0, 0)], Actions).

