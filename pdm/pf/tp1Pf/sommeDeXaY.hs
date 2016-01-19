
sommeDeXaY :: Int -> Int -> Int
sommeDeXaY x y = if x>y then 0 
		else x+sommeDeXaY (x+1) y

somme ::[Int] -> Int
somme[] = 0
somme (x:xs) = x+somme(xs)

lastof :: [a] -> a
lastof [] = error "il y'a rien dans la liste"
lastof xs = head (reverse xs)

initof :: [a] -> [a]
initof [] = error " il y'a aucun element dans la liste"
initof xs = reverse(tail (reverse xs))


-- (++)
plusplus :: [a] -> [a] -> [a]
plusplus [] [] = []
plusplus [] xs = xs
plusplus xs [] = xs
plusplus (x:xs) (y:ys) = x:((plusplus xs (plusplus (y:[]) ys)))


-- concat
concatener :: [[a]] -> [a]
concatener [[]] = []
concatener [x:xs , ys]= x:(plusplus xs ys)

--map
maper :: (a -> a) -> [a] -> [a]
maper f [] = []
maper f (x:xs) = (f x):(maper f xs) 

{-
question 7
x= (!!) l represente une fonction une fonction qui prend en argument une liste et retourne une fonction qui prend comme argument un entier
-}

-- une longueur de liste

longueur :: [a] -> Int
longueur [] = 0
longueur xs = somme xs
