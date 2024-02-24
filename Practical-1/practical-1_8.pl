% phone_list(Name, Phone, Birthday)
phone_list('Alice', '123-456-7890', '1990-02-15').
phone_list('Bob', '987-654-3210', '1995-08-25').
phone_list('Charlie', '555-555-5555', '1988-02-10').
phone_list('David', '111-222-3333', '2000-02-28').
phone_list('Emma', '444-444-4444', '1992-03-20').

% Predicate to extract the month from a date in the format 'YYYY-MM-DD'
get_month(Date, Month) :-
    sub_atom(Date, 6, 2, _, Month).

% Predicate to get the current month
current_month(Month) :-
    get_time(Stamp),
    stamp_date_time(Stamp, DateTime, 'UTC'),
    date_time_value(month, DateTime, Month).

% Predicate to find people whose birthday is in the current month
birthday_in_current_month(Name) :-
    phone_list(Name, _, Birthday),
    current_month(CurrentMonth),
    get_month(Birthday, CurrentMonth).

% Query to get a list of people whose birthdays are in the current month
% ?- birthday_in_current_month(Name), writeln(Name), fail.



