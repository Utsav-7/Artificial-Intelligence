% Define the initial state of the monkey, box, and banana positions
initial_state(at(monkey, middle), at(box, middle), at(banana, ceiling)).

% Define possible moves
move(state(at(monkey, middle), at(box, middle), at(floor, ceiling)), grasp, state(at(monkey, middle), at(box, middle), at(banana, monkey))).
move(state(at(monkey, middle), at(floor, middle), at(banana, monkey)), climb, state(at(monkey, middle), at(box, middle), at(banana, monkey))).
move(state(at(monkey, middle), at(box, middle), at(banana, monkey)), push, state(at(monkey, floor), at(box, middle), at(banana, monkey))).
move(state(at(monkey, middle), at(floor, middle), at(banana, monkey)), reach, state(at(monkey, floor), at(box, middle), at(banana, monkey))).

% Define goal state
goal_state(state(at(monkey, floor), at(box, middle), at(banana, monkey))).

% Define solve predicate using depth-first search
solve(State, History, []) :- goal_state(State), reverse(History, Solution), write_solution(Solution).
solve(State, History, [Move | Moves]) :- move(State, Move, NextState), \+ member(NextState, History), solve(NextState, [NextState | History], Moves).

% Define predicate to write solution
write_solution([]) :- nl.
write_solution([Move | Moves]) :- write(Move), nl, write_solution(Moves).

% Example usage:
% ?- initial_state(Monkey, Box, Banana), solve(Monkey, [Monkey], Solution).

