% Define symptoms for diseases
disease(cold, [cough, runny_nose, sore_throat]).
disease(flu, [fever, cough, headache, muscle_aches]).
disease(allergy, [sneezing, itchy_eyes, runny_nose]).
disease(pneumonia, [cough, fever, chest_pain, difficulty_breathing]).

% Check if all elements of List1 are in List2
subset([], _).
subset([X|Xs], List) :-
    member(X, List),
    subset(Xs, List).

% Diagnose based on symptoms
diagnose(Disease, Symptoms) :-
    disease(Disease, DiseaseSymptoms),
    subset(Symptoms, DiseaseSymptoms).

% Query example
% ?- diagnose(Disease, [cough, fever]).
% Disease = flu ;
% Disease = pneumonia.
