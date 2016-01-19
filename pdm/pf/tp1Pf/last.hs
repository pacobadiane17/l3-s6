module TP1 where

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

-- la  longueur de liste
longueur :: [a] -> Int
longueur [] = 0
longueur (x:xs) = somme ((map (x /) x):(longueur xs))



{-
--recursive
recursive :: (a -> a) -> a -> Integer -> [a]
recursive f x 0 = []
recursive f x 1 = x:[]
resursive f x n = x:(recursive f ((head((recursive f x (n-1))))) n)
-}

-- recursive avec iterate et take
recursive' :: (a -> a) -> a -> Int -> [a]
recursive' f x n = take n (iterate f x)

--lister de 0 à n
lister :: Int -> [Int]
lister n = recursive' (1 +) 0 (n+1)
