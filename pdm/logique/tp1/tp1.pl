contenu(princesse).
contenu(tigre).

pancarte1(tigre, Y) :- contenu(Y).
pancarte1(X, princesse) :- contenu(X).
pancarte2(princesse, Y) :- contenu(Y).

salle1(X,Y) :- pancarte1(X,Y), pancarte2(X,Y).

pancarte3(princesse, tigre).
pancarte4(princesse,tigre).
pancarte4(tigre,princesse).

salle2(X,Y):- pancarte3(X,Y), not(pancarte4(X,Y)).
salle2(X,Y):- pancarte4(X,Y), not(pancarte3(X,Y)).

/*
porte1(X):- contenu(X),X=princesse.
porte2(X):-porte1(X),X=tigre.
porte3(X):-not(X=tigre),not(X=princesse).

salle3(X,Y,Z)= porte1(X),not(porte2(Y)),porte3(Z).
salle3(X,Y,Z)= not(porte1(X)),porte2(Y),not(porte3(Z)).
*/
