foil_predicates([pajaro/1, pinguino/1, gato/1, vuela/1, '='/2]).
foil_cwa(true).                   
foil_use_negations(true).        
foil_det_lit_bound(0).            

verbosity(1).

pajaro(X) :- pinguino(X).
pajaro(piolin).
pajaro(zazu).
gato(silvestre).
pinguino(pingu).

vuela(piolin). 
vuela(zazu).





