paciente(juan).
doctor(maria).
experto(marcos).
experto(eduardo).

afirma(marcos, hizo_dano(doctor(maria), paciente(juan))).
afirma(eduardo,cuidadoso(doctor(maria))).

- responsable(doctor(D)) :- pautas_correctas(pautas, doctor(D)).
responsable(doctor(D)) := hizo_dano(doctor(D), paciente(P)).

hizo_dano(doctor(D),paciente(P)) := afirma(X, hizo_dano(doctor(D), paciente(P))) , experto(X).
pautas_correctas(pautas, doctor (D)) := afirma(X ,cuidadoso(doctor (D))) , experto(X).








