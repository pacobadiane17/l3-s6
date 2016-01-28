

longueur([],0).
longueur([X|L],A):- longueur(L,Z) , A is 1 + Z.

somme([],0).
somme([X|L],A):- somme(L,Z) , A is X + Z.


membre(X,[Y|L]):- X == Y, !.
membre(X,[Y|L]):- membre(X,L).

ajoute_en_tete(X,[],[X]). 
ajoute_en_tete(X,Y,[X|Y]).

ajoute_en_queue(X, [], [X]).
ajoute_en_queue(X, [T|Q], [T|L]) :-
	ajoute_en_queue(X, Q, L).

extraire_tete([],[],[]).
extraire_tete([X|Y],Z,L):- Z = X , Y = L. 

concatene(X,[],X).
concatene(Z,[X|Y],L):- ajoute_en_queue(X,Z,E) , concatene(E,Y,L).

retourne(X,[],X).
retourne([X|Y],[],A):- retourne(Y,[],[]|X).
