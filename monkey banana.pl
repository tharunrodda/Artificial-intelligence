
initial_state(state(on_floor, on_floor, hanging)).


goal_state(state(on_ladder, under_banana, grabbed)).


move_ladder(state(on_floor, on_floor, hanging), state(on_floor, under_banana, hanging)).


climb_ladder(state(on_floor, under_banana, hanging), state(on_ladder, under_banana, hanging)).

grab_banana(state(on_ladder, under_banana, hanging), state(on_ladder, under_banana, grabbed)).


perform_action(Action, State, NewState) :-
    (   Action = move_ladder,
        move_ladder(State, NewState)
    ;   Action = climb_ladder,
        climb_ladder(State, NewState)
    ;   Action = grab_banana,
        grab_banana(State, NewState)
    ).

plan(State, [], State) :- goal_state(State).
plan(State, [Action | Actions], FinalState) :-
    perform_action(Action, State, NewState),
    plan(NewState, Actions, FinalState).

