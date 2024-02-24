% Create a list
create_list(List) :-
    List = [1, 2, 3, 4, 5].

% Write in list
% This operation is essentially creating a list, so it's already covered in create_list/1.

% Check membership
is_member(Element, List) :-
    member(Element, List).

% Length of a list
list_length([], 0).
list_length([_ | Tail], Length) :-
    list_length(Tail, TailLength),
    Length is TailLength + 1.

% Reverse a list
reverse_list(List, Reversed) :-
    reverse(List, Reversed).

% Concatenation
concatenate_lists(List1, List2, Concatenated) :-
    append(List1, List2, Concatenated).

% Add an item
add_item(Item, List, NewList) :-
    append(List, [Item], NewList).

% Delete an item
delete_item(Item, List, NewList) :-
    delete(List, Item, NewList).

% Sublist
sublist(Sublist, List) :-
    sublist_starting(Sublist, List).
sublist(Sublist, [_ | Tail]) :-
    sublist(Sublist, Tail).

sublist_starting(Sublist, List) :-
    append(Sublist, _, List).

% Permutations
list_permutations(List, Permutations) :-
    permutation(List, Permutations).

% Append list
append_list(List1, List2, Appended) :-
    append(List1, List2, Appended).

% Finding nth element
nth_element(N, List, Element) :-
    nth1(N, List, Element).

