hombre(rodolfo).
hombre(marcelo).
hombre(felipe).
hombre(ivan).
hombre(sebastian).

mujer(margarita).
mujer(elena).
mujer(sandra).
mujer(carolina).

progenitor(rodolfo, marcelo).
progenitor(rodolfo, sandra).
progenitor(marcelo, felipe).
progenitor(marcelo, carolina).
progenitor(margarita, marcelo).
progenitor(margarita, sandra).
progenitor(elena, felipe).
progenitor(elena, carolina).
progenitor(ivan, sebastian).
progenitor(sandra, sebastian).

padre(X, Y) :-
	progenitor(X, Y),
	hombre(X).

madre(X, Y) :-
	progenitor(X, Y),
	mujer(X).

ancestro(X, Y) :-
		padre(X, Y); madre(X, Y).

ancestro(X, Y) :-
	ancestro(Z, Y),
	(padre(X, Z) ; madre(X, Z)).
