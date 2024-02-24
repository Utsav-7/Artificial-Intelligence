% Predicate to convert Celsius to Fahrenheit
celsius_to_fahrenheit(Celsius, Fahrenheit) :-
    Fahrenheit is (Celsius * 9/5) + 32.

% Predicate to check if temperature is below freezing (0°C or 32°F)
below_freezing(Temperature) :-
    Temperature =< 0.

% Example usage:
% To convert Celsius to Fahrenheit, you can use:
% ?- celsius_to_fahrenheit(0, Fahrenheit).
% Fahrenheit = 32.0

% To check if a temperature is below freezing, you can use:
% ?- below_freezing(10).
% false. (As 10°C is above freezing)

% ?- below_freezing(-5).
% true. (As -5°C is below freezing)

