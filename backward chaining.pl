% Facts
has_feathers(eagle).
has_feathers(penguin).
lays_eggs(eagle).
lays_eggs(penguin).
can_fly(eagle).
has_scales(snake).
has_scales(lizard).
lays_eggs(snake).
lays_eggs(lizard).
cold_blooded(snake).
cold_blooded(lizard).

% Rules
bird(X) :- has_feathers(X), lays_eggs(X).
reptile(X) :- has_scales(X), lays_eggs(X), cold_blooded(X).
can_fly(X) :- bird(X), \+ (X = penguin).

% Queries to demonstrate backward chaining
% To find out if an animal is a bird:
% ?- bird(eagle).
% ?- bird(penguin).

% To find out if an animal is a reptile:
% ?- reptile(snake).
% ?- reptile(lizard).

% To find out if an animal can fly:
% ?- can_fly(eagle).
% ?- can_fly(penguin).