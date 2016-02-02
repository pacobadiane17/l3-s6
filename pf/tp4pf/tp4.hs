module Arbre where

data Arbre coul val = Noeud couleur valeur [Arbre coul val]
                      
	deriving Show
