

import Graphics.Gloss

main = animate (InWindow "Dragon" (500, 500) (0, 0)) white (dragonAnime (50,250) (450,250) )

dragonAnime a b t = Line (dragonOrdre a b t)


pointAintercaler :: Point -> Point -> Point
pointAintercaler (a,b) (c,d) = (((a+c)/2 +(b-d)/2),((b+d)/2 +(a-c)/2))

pasDragon :: Path -> Path
pasDragon (x:[])   = [x]
pasDragon (x:y:xs) = x:(pointAintercaler x y):(pasDragon (y:xs))

dragon :: Point -> Point ->[Path]
dragon x y  = iterate  pasDragon [x,y]

dragonOrdre :: Point -> Point -> Int -> Path
dragonOrdre x y t = dragon x y  !! t
