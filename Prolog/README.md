## Ejemplo 1
```prolog
ultimo_elemento(X, [1, 2, 3]).
├── ultimo_elemento(X, [X|[]]). -> false.
├── ultimo_elemento(X, [_|Xs]). -> X: incógnita, _: 1, Xs: [2, 3]
    ==> ultimo_elemento(X, [2, 3]).
        ├── ultimo_elemento(X, [X|[]]). -> false.
        ├── ultimo_elemento(X, [_|Xs]). -> X: incógnita, _: 2, Xs: [3]
            ==> ultimo_elemento(X, [3]).
                ├── ultimo_elemento(X, [X|[]]). -> X: 3.
                ├── ultimo_elemento(X, [_|Xs]). -> X: incógnita, _: 3, Xs: []
                    ==> ultimo_elemento(X, []).
                        ├── ultimo_elemento(X, [X|[]]). -> false.
                        ├── ultimo_elemento(X, [_|Xs]). -> false.

ultimo_elemento(X, []).
├── ultimo_elemento(X, [X|[]]). -> false.
├── ultimo_elemento(X, [_|Xs]). -> false.
```

## Ejemplo 2
```prolog
padre(X, felipe).
├── progenitor(X, Y). -> X: incógnita, Y: felipe.
    ├── progenitor(rodolfo, marcelo).   -> false.
    ├── progenitor(rodolfo, sandra).    -> false.
    ├── progenitor(marcelo, felipe).    -> X: marcelo.
    ==> hombre(marcelo).
        ├── hombre(rodolfo).    -> false.
        ├── hombre(marcelo).    -> true.
        ├── hombre(felipe).     -> false.
        ├── hombre(ivan).       -> false.
        ├── hombre(sebastian).  -> false.
% Hay más posibilidades para esta declaración.
├── progenitor(X, Y). -> X: incógnita, Y: felipe.
    ├── progenitor(marcelo, carolina).  -> false.
    ├── progenitor(margarita, marcelo). -> false.
    ├── progenitor(margarita, sandra).  -> false.
    ├── progenitor(elena, felipe).      -> false.
    ├── progenitor(elena, carolina).    -> false.
    ├── progenitor(ivan, sebastian).    -> false.
    ├── progenitor(sandra, sebastian).  -> false.
    
ancenstro(X, felipe).
├── ancestro(X, Y). X: incógnita, Y: felipe.
    ==> padre(X, felipe). X: incógnita.
        % Ya lo vimos antes, X = marcelo y false.
    ==> madre(X, madre). X: incógnita.
        % Funciona igual que padre, X = elena y false.
├── ancestro(X, Y). X: incógnita, Y: felipe.
    ==> padre(X, Z); madre(X, Z). X: incógnita, Z: incógnita.
        % Toma todas las combinaciones de madre y padre.
    ==> ancestro(Z, Y). Z: determinado por el anterior, Y: felipe.
         % Repite el proceso hasta que Z sea padre o madre de felipe.
```

## Ejemplo 3
```
ancenstro(X, felipe).
├── ancestro(X, Y). X: incógnita, Y: felipe.
    ==> padre(X, felipe). X: incógnita.
        % Ya lo vimos antes, X = marcelo y false.
    ==> madre(X, madre). X: incógnita.
        % Funciona igual que padre, X = elena y false.
├── ancestro(X, Y). X: incógnita, Y: felipe.
    ==> ancestro(X, Z). X: incógnita, Z: incógnita.
        % Busca todas las condiciones que no han sido aceptadas antes con esta afirmación 
```
