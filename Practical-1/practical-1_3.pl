symptom(john, fever).
symptom(john, cough).
symptom(jane, headache).
symptom(jane, fatigue).
diagnosis(Patient, flu) :-
   symptom(Patient, fever),
   symptom(Patient, cough).
diagnosis(Patient, common_cold) :-
   symptom(Patient, cough),
   symptom(Patient, headache).
diagnosis(Patient, unknown) :-
   diagnosis(Patient, flu),
   diagnosis(Patient, common_cold). 
