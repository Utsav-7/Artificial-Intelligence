% Base case: sum of first 0 numbers is 0
sum_numbers(0, 0).

% Recursive case: sum of first N numbers is N + sum of first N-1 numbers
sum_numbers(N, Sum) :-
    N > 0,
    N1 is N - 1,
    sum_numbers(N1, Sum1),
    Sum is N + Sum1.

% Examples of arithmetic operations
example_arithmetic_operations :-
    X is 5 + 3,
    Y is 7 - 2,
    Z is 4 * 6,
    W is 8 / 2,
    write('Addition: '), writeln(X),
    write('Subtraction: '), writeln(Y),
    write('Multiplication: '), writeln(Z),
    write('Division: '), writeln(W).

% Examples of recursion
example_recursion :-
    write('Enter a number (N): '),
    read(N),
    sum_numbers(N, Sum),
    write('Sum of numbers from 1 to '), write(N), write(': '), writeln(Sum).

% Entry point for running the examples
run_examples :-
    example_arithmetic_operations,
    example_recursion.

% Load the file and run the examples
:- run_examples.
