:- dynamic basket/1.

init :-
    retractall(basket(_)),
    assertz(basket([coffee, milk, chocolate, apple, juice])).

start :-
    init,
    menu.

menu :-
    nl,
    write('** SHOPPING LIST **'), nl,
    write('d. display all items.'), nl,
    write('a. Add an item to the list.'), nl,
    write('e. exit.'), nl,
    write('ENTER YOUR CHOICE .'), nl,
    write('|: '),
    read(Choice),
    process(Choice).

process(d) :- display_items, menu.
process(a) :- add_item, menu.
process(e) :- write('Goodbye!'), nl.
process(_) :- write('Invalid choice, try again.'), nl, menu.

% Display the items using recursion over the list, stopping at the empty list
display_items :-
    basket(List),
    display_list(List).

display_list([]).
display_list([Item|Rest]) :-
    write(Item), nl,
    display_list(Rest).

add_item :-
    write('enter the item you want to add it'), nl,
    write('|: '),
    read(Item),
    retract(basket(List)),
    append(List, [Item], NewList),
    assertz(basket(NewList)),
    write('The item has been added'), nl.