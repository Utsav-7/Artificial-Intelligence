% Base case: Fibonacci of 0 is 0
fibonacci(0, 0).

% Base case: Fibonacci of 1 is 1
fibonacci(1, 1).

% Recursive case: Fibonacci of N is the sum of Fibonacci of N-1 and N-2
fibonacci(N, Result) :-
    N > 1,
    N1 is N - 1,
    N2 is N - 2,
    fibonacci(N1, F1),
    fibonacci(N2, F2),
    Result is F1 + F2.

% Display Fibonacci series up to N
display_fibonacci_series(0, []).
display_fibonacci_series(N, [F | Series]) :-
    N > 0,
    fibonacci(N, F),
    N1 is N - 1,
    display_fibonacci_series(N1, Series).

% Example usage:
% To display the first 10 Fibonacci numbers, you can use:
% ?- display_fibonacci_series(10, Series).
% Series = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]

% Or you can display Fibonacci of a specific number, for example:
% ?- fibonacci(7, Result).
% Result = 13
