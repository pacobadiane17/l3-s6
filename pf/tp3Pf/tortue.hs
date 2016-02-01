--module Tortue where

import Graphics.Gloss

type Symbole  = Char
type Mot      = [Symbole]
type Axiome   = Mot
type Regles   = Symbole -> Mot
type LSysteme = [Mot]
type EtatTortue = (Point, Float)

type Config = (EtatTortue -- État initial de la tortue
              ,Float      -- Longueur initiale d’un pas
              ,Float      -- Facteur d’échelle
              ,Float      -- Angle pour les rotations de la tortue
              ,[Symbole]) -- Liste des symboles compris par la tortue

type EtatDessin = (EtatTortue, Path)


etatInitial :: Config -> EtatTortue
etatInitial (a,b,c,d,e) = a

longueurPas :: Config -> Float
longueurPas (a,b,c,d,e) = b

facteurEchelle :: Config -> Float
facteurEchelle (a,b,c,d,e) = c

angle :: Config -> Float
angle (a,b,c,d,e) = d

symbolesTortue :: Config -> [Symbole]
symbolesTortue (a,b,c,d,e) = e

avance :: Config -> EtatTortue -> EtatTortue
avance c ((x,y), ang) = (((x+(longueurPas c)*(cos (angle c))),(y+(longueurPas c)*(sin (angle c)))),ang)

--- tourner a gauche
tourneAGauche :: Config -> EtatTortue -> EtatTortue
tourneAGauche c ((x,y),a) = ((x,y),((angle c)+a))
--tourner à droite
tourneADroite :: Config -> EtatTortue -> EtatTortue
tourneADroite c ((x,y),a) = ((x,y),((angle c)-a))

filtreSymbolesTortue :: Config -> Mot -> Mot
filtreSymbolesTortue c  m = [x | x<-m, x `elem` symbolesTortue c ]

interpreteSymbole :: Config -> EtatDessin -> Symbole -> EtatDessin
interpreteSymbole c (e,p) x  | x == '+' = ((tourneAGauche c e),p)
							 | x == '-' = ((tourneADroite c e),p)
							 | x =='F'  = ((avance c e),p)
							 |otherwise = erro "erreur de symbole"

interpreteMot :: Config -> Mot -> Picture
interpreteMot