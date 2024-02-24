% Define the initial state of the problem
initial_state(state(3, 3, left, 0, 0, right)).

% Define the goal state of the problem
goal_state(state(0, 0, right, 3, 3, left)).

% Define the possible moves
move(state(M1, C1, left, M2, C2, right), move(M, C), state(NewM1, NewC1, NewSide1, NewM2, NewC2, NewSide2)) :-
    member(M, [0, 1, 2]), member(C, [0, 1, 2]),
    M + C >= 1, M + C =< 2,
    (M =< M1; M1 =:= 0), (C =< C1; C1 =:= 0), % Check if there are enough missionaries and cannibals on the left side
    NewM1 is M1 - M, NewC1 is C1 - C,
    NewM2 is M2 + M, NewC2 is C2 + C,
    opposite_side(left, NewSide1), opposite_side(right, NewSide2).

move(state(M1, C1, right, M2, C2, left), move(M, C), state(NewM1, NewC1, NewSide1, NewM2, NewC2, NewSide2)) :-
    member(M, [0, 1, 2]), member(C, [0, 1, 2]),
    M + C >= 1, M + C =< 2,
    (M =< M2; M2 =:= 0), (C =< C2; C2 =:= 0), % Check if there are enough missionaries and cannibals on the right side
    NewM1 is M1 + M, NewC1 is C1 + C,
    NewM2 is M2 - M, NewC2 is C2 - C,
    opposite_side(left, NewSide2), opposite_side(right, NewSide1).

% Define helper predicate to determine opposite side
opposite_side(left, right).
opposite_side(right, left).

% Define the solve predicate using depth-first search
solve(State, _, []) :- goal_state(State).
solve(State, Visited, [Move | Moves]) :-
    move(State, Move, NextState),
    \+ member(NextState, Visited),
    solve(NextState, [NextState | Visited], Moves).

% Define a predicate to write out the solution
write_solution([]).
write_solution([Move | Moves]) :-
    write(Move), nl,
    write_solution(Moves).

% Define the main predicate to start the solution process
missionaries_and_cannibals :-
    initial_state(InitialState),
    solve(InitialState, [InitialState], Solution),
    write_solution(Solution).

