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


