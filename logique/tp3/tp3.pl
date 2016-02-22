transp([],[]).
transp([[T|Q1]|Q2],L):- [T|L2], L2 is transp(Q2), transp([Q1]).

