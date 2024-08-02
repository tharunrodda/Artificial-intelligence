% Define the sum/3 predicate.
sum(A, B, Sum) :-
    Sum is A + B.

% Entry point for the program to demonstrate usage.
main :-
    % Example usage of sum/3 predicate
    sum(3, 5, Result1),
    write('The sum of 3 and 5 is '), write(Result1), nl,
    
    sum(10, 20, Result2),
    write('The sum of 10 and 20 is '), write(Result2), nl,
    
    sum(-5, 7, Result3),
    write('The sum of -5 and 7 is '), write(Result3), nl.

% Run the main predicate when the script is executed.
:- main.
