% Facts: parent relationships
parent(john, mary).   % John is a parent of Mary
parent(john, david).  % John is a parent of David
parent(susan, mary).  % Susan is a parent of Mary
parent(susan, david). % Susan is a parent of David
parent(mary, anna).   % Mary is a parent of Anna
parent(mary, tom).    % Mary is a parent of Tom
parent(david, lily).  % David is a parent of Lily

% Rule: child relationship
child(X, Y) :- parent(Y, X).

% Rule: sibling relationship
sibling(X, Y) :-
    parent(Z, X),
    parent(Z, Y),
    X \= Y.

% Rule: grandparent relationship
grandparent(X, Y) :-
    parent(X, Z),
    parent(Z, Y).

% Rule: grandchild relationship
grandchild(X, Y) :- grandparent(Y, X).

% Rule: uncle/aunt relationship
uncle_or_aunt(X, Y) :-
    sibling(X, Z),
    parent(Z, Y).

% Rule: cousin relationship
cousin(X, Y) :-
    parent(Z1, X),
    parent(Z2, Y),
    sibling(Z1, Z2).


