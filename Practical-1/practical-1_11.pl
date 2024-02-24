% Define a predicate to check if a number is even
is_even(X) :-
    X mod 2 =:= 0.

% Define a predicate to check if a number is odd
is_odd(X) :-
    \+ is_even(X).

% Define a predicate to classify a number as even or odd
classify_number(X) :-
    is_even(X),
    !, % Cut operator; once we find that X is even, don't backtrack
    write(X), write(' is even'), nl.
classify_number(X) :-
    is_odd(X),
    write(X), write(' is odd'), nl.

% Define a predicate to check if a number is positive
is_positive(X) :-
    X > 0.

% Define a predicate to check if a number is negative
is_negative(X) :-
    X < 0.

% Define a predicate to classify a number as positive, negative, or zero
classify_sign(X) :-
    is_positive(X),
    !, % Cut operator; once we find that X is positive, don't backtrack
    write(X), write(' is positive'), nl.
classify_sign(X) :-
    is_negative(X),
    !, % Cut operator; once we find that X is negative, don't backtrack
    write(X), write(' is negative'), nl.
classify_sign(0) :-
    write('0 is neither positive nor negative'), nl,
    !, % Cut operator; once we find that X is zero, don't backtrack
    fail. % Fail to prevent further solutions for the case of 0

% Example usage:
% ?- classify_number(4).
% Output: 4 is even
%
% ?- classify_number(3).
% Output: 3 is odd
%
% ?- classify_sign(-5).
% Output: -5 is negative
%
% ?- classify_sign(10).
% Output: 10 is positive
%
% ?- classify_sign(0).
% Output: 0 is neither positive nor negative

