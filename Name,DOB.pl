% Facts about individuals and their dates of birth
person(john_doe, '1985-03-15').
person(jane_smith, '1990-07-22').
person(alice_johnson, '1982-11-30').
person(bob_brown, '1995-01-10').

% Rule to get the DOB of a person
dob(Person, DOB) :-
    person(Person, DOB).

% Rule to list all persons and their DOBs
list_all_persons(Persons) :-
    findall((Person, DOB), person(Person, DOB), Persons).

% Example queries:
% ?- dob(jane_smith, DOB).
% DOB = '1990-07-22'.

% ?- list_all_persons(Persons).
% Persons = [(john_doe, '1985-03-15'),
%            (jane_smith, '1990-07-22'),
%            (alice_johnson, '1982-11-30'),
%            (bob_brown, '1995-01-10')].
