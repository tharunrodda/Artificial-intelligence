% Define vowels
vowel(a).
vowel(e).
vowel(i).
vowel(o).
vowel(u).

% Rule to count vowels in a list
count_vowels([], 0).  % Base case: empty list has 0 vowels
count_vowels([H|T], N) :-
    vowel(H),         % Head is a vowel
    count_vowels(T, N1),  % Recursively count in the tail
    N is N1 + 1.          % Increment count
count_vowels([H|T], N) :-
    \+ vowel(H),      % Head is not a vowel
    count_vowels(T, N).   % Recursively count in the tail

% To query and find the number of vowels
% ?- count_vowels([a, b, c, d, e, i, o, u], N).
% N = 5.