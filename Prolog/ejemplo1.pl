ultimo_elemento(X, [X|[]]).
ultimo_elemento(X, [_|Xs]) :- ultimo_elemento(X, Xs).
