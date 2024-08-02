% Facts about students and their enrolled subjects
student(john).
student(jane).
student(alice).
student(bob).

enrolled(john, math).
enrolled(john, science).
enrolled(jane, history).
enrolled(alice, math).
enrolled(alice, history).
enrolled(bob, science).

% Facts about teachers and the subjects they teach
teacher(mr_smith).
teacher(ms_jones).
teacher(dr_brown).

teaches(mr_smith, math).
teaches(ms_jones, history).
teaches(dr_brown, science).

% Facts about subjects and their codes
subject_code(math, 'MTH101').
subject_code(science, 'SCI101').
subject_code(history, 'HIS101').

% Rule to get the subject code for a subject
subject_code_for_subject(Subject, Code) :-
    subject_code(Subject, Code).

% Rule to find students enrolled in a specific subject
students_in_subject(Subject, Students) :-
    findall(Student, enrolled(Student, Subject), Students).

% Rule to find teachers for a specific subject
teachers_for_subject(Subject, Teachers) :-
    findall(Teacher, teaches(Teacher, Subject), Teachers).

% Example queries:
% ?- subject_code_for_subject(math, Code).
% Code = 'MTH101'.

% ?- students_in_subject(math, Students).
% Students = [john, alice].

% ?- teachers_for_subject(science, Teachers).
% Teachers = [dr_brown].
