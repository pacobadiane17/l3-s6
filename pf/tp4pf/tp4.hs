module Arbre where

data Arbre coul val = Noeud  {couleur :: coul
			     ,valeur :: val
			     ,gauche = Arbre coul val
			     ,droite = Arbre coul val}
		    |Feuille
                      
	deriving Show




mapArbre :: (a-> b) -> Arbre a  -> Arbre b
mapArbre f Feuille = [] 
mapArbre f (Noeud a b c) = f (Noeud a b ):(mapArbre f c)

foldArbre : 

