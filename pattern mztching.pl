% Facts
list_contains([apple, banana, cherry], banana).
list_contains([1, 2, 3, 4, 5], 3).
list_contains([a, b, c, d], d).

% Rules
contains(X, [X|_]).  % X is the head of the list
contains(X, [_|T]) :- contains(X, T).  % X is in the tail of the list

% Queries to demonstrate pattern matching
% To check if a list contains a specific element:
% ?- contains(banana, [apple, banana, cherry]).
% ?- contains(3, [1, 2, 3, 4, 5]).
% ?- contains(d, [a, b, c, d]).
% ?- contains(e, [a, b, c, d]).  % Should return false
% Rules
string_contains(Sub, Str) :- append(_, Rest, Str), append(Sub, _, Rest).

% Queries to demonstrate pattern matching
% To check if a string contains a specific substring:
% ?- string_contains([b, a, n], [a, p, p, l, e, b, a, n, a, n, a]).
% ?- string_contains([c, h, e, r], [c, h, e, r, r, y]).
% ?- string_contains([e, x], [e, x, a, m, p, l, e]).
% ?- string_contains([t, e, s], [t, e, s, t, i, n, g]).
% ?- string_contains([z], [a, b, c, d]).  % Should return false