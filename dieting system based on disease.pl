% Facts: food recommendations for diseases
% Foods to eat
eat_for(heart_disease, oatmeal).
eat_for(heart_disease, apple).
eat_for(diabetes, broccoli).
eat_for(diabetes, carrot).
eat_for(high_blood_pressure, salmon).
eat_for(high_blood_pressure, spinach).

% Foods to avoid
avoid_for(heart_disease, bacon).
avoid_for(heart_disease, donuts).
avoid_for(diabetes, soda).
avoid_for(diabetes, candy).
avoid_for(high_blood_pressure, red_meat).
avoid_for(high_blood_pressure, butter).

% Rule: recommended foods for a disease
recommended_food(Disease, Food) :-
    eat_for(Disease, Food).

% Rule: foods to avoid for a disease
avoid_food(Disease, Food) :-
    avoid_for(Disease, Food).

% Example Queries:
% ?- recommended_food(heart_disease, Food).      % Expected: oatmeal, apple
% ?- avoid_food(heart_disease, Food).            % Expected: bacon, donuts
% ?- recommended_food(diabetes, Food).           % Expected: broccoli, carrot
% ?- avoid_food(diabetes, Food).                 % Expected: soda, candy
% ?- recommended_food(high_blood_pressure, Food).% Expected: salmon, spinach
% ?- avoid_food(high_blood_pressure, Food).      % Expected: red_meat, butter

% Queries to get all results at once
% ?- findall(Food, recommended_food(heart_disease, Food), Foods). % Expected: [oatmeal, apple]
% ?- findall(Food, avoid_food(heart_disease, Food), Foods).       % Expected: [bacon, donuts]
