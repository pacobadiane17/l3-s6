
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
