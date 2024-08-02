% Define the predicate to move a single disk
move(1, X, Y) :-
    format('Move disk from ~w to ~w~n', [X, Y]).

% Base case: Move a single disk from Source to Destination
hanoi(1, Source, Destination, _) :-
    move(1, Source, Destination).

% Recursive case: Move N disks from Source to Destination using Auxiliary
hanoi(N, Source, Destination, Auxiliary) :-
    N > 1,
    M is N - 1,
    hanoi(M, Source, Auxiliary, Destination),   % Move N-1 disks from Source to Auxiliary
    move(1, Source, Destination),                % Move the largest disk from Source to Destination
    hanoi(M, Auxiliary, Destination, Source).    % Move N-1 disks from Auxiliary to Destination
