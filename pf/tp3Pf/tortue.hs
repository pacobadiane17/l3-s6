{-
	Pape Ibrahima BADIANE
	Alexandre TROUCHAUD
-}

module Tortue where

import Graphics.Gloss
import LSysteme

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
avance c ((x,y), ang) = (((x+(longueurPas c)*(cos (ang))),(y+(longueurPas c)*(sin (ang)))),ang)

--- tourner a gauche
tourneAGauche :: Config -> EtatTortue -> EtatTortue
tourneAGauche c ((x,y),a) = ((x,y),(a+(angle c)))

--tourner à droite
tourneADroite :: Config -> EtatTortue -> EtatTortue
tourneADroite c ((x,y),a) = ((x,y),(a-(angle c)))

filtreSymbolesTortue :: Config -> Mot -> Mot
filtreSymbolesTortue c  m = [x | x<-m, x `elem` symbolesTortue c ]

interpreteSymbole :: Config -> EtatDessin -> Symbole -> EtatDessin
interpreteSymbole c (e,p) x  | x == '+' = ((tourneAGauche c e),p++ [fst(tourneAGauche c e)])
			     | x == '-' = ((tourneADroite c e),p ++ [fst(tourneADroite c e)])
			     | x =='F'  = ((avance c e),p ++ [fst(avance c e)])
			     |otherwise = error "erreur de symbole"

interpreteMot :: Config -> Mot -> Picture
<<<<<<< HEAD
interpreteMot
=======
interpreteMot c m = line (snd (foldl (interpreteSymbole c) iE mF))
    where iP = fst (etatInitial c)
          iE = (etatInitial c, [iP])
          mF = filtreSymbolesTortue c m


vonKoch1 :: LSysteme
vonKoch1 = lsysteme "F" regles
    where regles 'F' = "F-F++F-F"
          regles  s  = [s]

vonKoch2 :: LSysteme
vonKoch2 = lsysteme "F++F++F++" regles
    where regles 'F' = "F-F++F-F"
          regles  s  = [s]

hilbert :: LSysteme
hilbert = lsysteme "X" regles
    where regles 'X' = "+YF-XFX-FY+"
          regles 'Y' = "-XF+YFY+FX-"
          regles  s  = [s]

dragon :: LSysteme
dragon = lsysteme "FX" regles
    where regles 'X' = "X+YF+"
          regles 'Y' = "-FX-Y"
          regles  s  = [s]

lsystemeAnime :: LSysteme -> Config -> Float -> Picture
lsystemeAnime ls c t = interpreteMot conf (ls !! enieme)
  where enieme = round t `mod` 10
        conf = case c of
          (e, p, fE, a, s) -> (e, p * (fE ^ enieme), fE, a, s)

vonKoch1Anime :: Float -> Picture
vonKoch1Anime = lsystemeAnime vonKoch1 (((-400, 0), 0), 800, 1/3, pi/3, "F+-")

vonKoch2Anime :: Float -> Picture
vonKoch2Anime = lsystemeAnime vonKoch2 (((-400, -250), 0), 800, 1/3, pi/3, "F+-")

hilbertAnime :: Float -> Picture
hilbertAnime = lsystemeAnime hilbert (((-400, -400), 0), 800, 1/2, pi/2, "F+-")

dragonAnime :: Float -> Picture
dragonAnime = lsystemeAnime dragon (((0, 0), 0), 50, 1, pi/2, "F+-")

dessin :: Picture
dessin = interpreteMot (((-150,0),0),100,1,pi/3,"F+-") "F+F--F+F"

main :: IO ()
main = animate (InWindow "L-systeme" (1000, 1000) (0, 0)) white hilbertAnime

>>>>>>> 8908d88db1d6dcd11f8939e37a56adca602cb90e
