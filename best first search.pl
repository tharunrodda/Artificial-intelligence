% Define the graph as facts
edge(a, b, 1).
edge(a, c, 4).
edge(b, c, 2).
edge(b, d, 5).
edge(c, d, 1).

% Define the heuristic function
heuristic(a, 7).
heuristic(b, 6).
heuristic(c, 2).
heuristic(d, 0).

% Best-first search algorithm
best_first_search(Start, Goal, Path, Cost) :-
    heuristic(Start, HeuristicStart),
    best_first_search([[Start, 0, HeuristicStart, [Start]]], Goal, Path, Cost).

% Best-first search with priority queue management
best_first_search([[Goal, PathCost, _, Path] | _], Goal, Path, PathCost) :- !.
best_first_search([Current | Rest], Goal, FinalPath, FinalCost) :-
    expand(Current, NewPaths),
    append(Rest, NewPaths, AllPaths),
    insertion_sort(AllPaths, SortedPaths),
    best_first_search(SortedPaths, Goal, FinalPath, FinalCost).

% Expand the current path by exploring its neighbors
expand([Node, PathCost, _, Path], NewPaths) :-
    findall([Next, NewPathCost, HeuristicNext, [Next | Path]],
            (edge(Node, Next, Cost),
             \+ member(Next, Path),
             NewPathCost is PathCost + Cost,
             heuristic(Next, HeuristicNext)),
            NewPaths).

% Insertion sort for sorting paths based on total estimated cost
insertion_sort(List, Sorted) :-
    insertion_sort(List, [], Sorted).

insertion_sort([], Acc, Acc).
insertion_sort([Head | Tail], Acc, Sorted) :-
    insert(Head, Acc, NewAcc),
    insertion_sort(Tail, NewAcc, Sorted).

insert([Node, PathCost1, Heuristic1, Path], [], [[Node, PathCost1, Heuristic1, Path]]).
insert([Node, PathCost1, Heuristic1, Path], [[_, PathCost2, Heuristic2, _] | Rest],
       [[Node, PathCost1, Heuristic1, Path] | [[_, PathCost2, Heuristic2, _] | Rest]]) :-
    TotalCost1 is PathCost1 + Heuristic1,
    TotalCost2 is PathCost2 + Heuristic2,
    TotalCost1 =< TotalCost2.
insert(Element, [Head | Tail], [Head | SortedTail]) :-
    insert(Element, Tail, SortedTail).


