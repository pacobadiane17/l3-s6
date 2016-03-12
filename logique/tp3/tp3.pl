<<<<<<< HEAD



%println([_|Queue]):-  write(_| L), L is println(Queue).
println([Tete|Queue]):- integer(Tete |L),write(Tete),!.
println([Queue]).
%println([Tete]):-integer(Tete), write(Tete).
%println([]):-!.
=======
transp([],[]).
transp([[T|Q1]|Q2],L):- [T|L2], L2 is transp(Q2), transp([Q1]).

>>>>>>> 8908d88db1d6dcd11f8939e37a56adca602cb90e
