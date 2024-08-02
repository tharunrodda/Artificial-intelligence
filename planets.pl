% Define basic facts about planets
planet(mercury).
planet(venus).
planet(earth).
planet(mars).
planet(jupiter).
planet(saturn).
planet(uranus).
planet(neptune).

% Define facts about moons
has_moons(earth).
has_moons(mars).
has_moons(jupiter).
has_moons(saturn).

% Define a simple rule to check if a planet has moons
planet_with_moons(Planet) :-
    has_moons(Planet).

% Example queries:
% ?- planet(X).
% X = mercury ;
% X = venus ;
% X = earth ;
% X = mars ;
% X = jupiter ;
% X = saturn ;
% X = uranus ;
% X = neptune.

% ?- planet_with_moons(X).
% X = earth ;
% X = mars ;
% X = jupiter ;
% X = saturn.
