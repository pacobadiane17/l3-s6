


%println([_|Queue]):-  write(_| L), L is println(Queue).
println([Tete|Queue]):- integer(Tete |L),write(Tete),!.
println([Queue]).
%println([Tete]):-integer(Tete), write(Tete).
%println([]):-!.