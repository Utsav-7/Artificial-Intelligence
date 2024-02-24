% Base case: Factorial of 0 is 1
factorial(0, 1).

% Recursive case: Factorial of N is N multiplied by factorial of (N-1)
factorial(N, Result) :-
    N > 0,
    N1 is N - 1,
    factorial(N1, SubResult),
    Result is N * SubResult.

% Example usage:
% To find the factorial of 5, you can use:
% ?- factorial(5, Result).
% Result = 120

