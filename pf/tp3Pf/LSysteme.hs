{-
	Pape Ibrahima BADIANE
	Alexandre TROUCHAUD
-}

module LSysteme where

type Symbole  = Char
type Mot      = [Symbole]
type Axiome   = Mot
type Regles   = Symbole -> Mot
type LSysteme = [Mot]

motSuivant :: Regles -> Mot -> Mot
motSuivant r [] = []
motSuivant r (x:xs) = (r x) ++ (motSuivant r xs)

motSuivant' :: Regles -> Mot -> Mot
motSuivant' r x = concat[ (r s) | s <- x]

motSuivant'' :: Regles -> Mot -> Mot
motSuivant'' r xs = concatMap r xs

regles :: Symbole -> Mot
regles  '+' = "+"
regles  '-' = "-"
regles 'F' = "F-F++F-F"


lsysteme :: Axiome -> Regles -> LSysteme
lsysteme a r = iterate (motSuivant r )a




