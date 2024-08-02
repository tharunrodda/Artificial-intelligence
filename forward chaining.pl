% Facts
parent(tom, bob).
parent(bob, ann).
parent(bob, pat).
parent(pat, jim).

male(tom).
male(bob).
male(jim).

female(ann).
female(pat).

% Rules
grandparent(X, Y) :- parent(X, Z), parent(Z, Y).
brother(X, Y) :- parent(Z, X), parent(Z, Y), male(X), X \= Y.
sister(X, Y) :- parent(Z, X), parent(Z, Y), female(X), X \= Y.

% Queries
% To find grandparents:
% ?- grandparent(tom, Y).

% To find brothers:
% ?- brother(X, Y).

% To find sisters:
% ?- sister(X, Y).