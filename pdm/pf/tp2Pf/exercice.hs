
-- alterne
alterne :: Num a => [a] -> [a]
alterne [] = []
alterne (x:[]) = x:[]
alterne (x1:x2:xs) = x1:alterne xs



--combine
combine ::(a -> b -> c) -> [a] -> [b] -> [c]
combine f xs [] =  []
combine f [] xs = []
combine f (x:xs) (y:ys) = (f x y):(combine f xs ys)


-- triangle pascal

pasPascal :: [Integer] -> [Integer]
pasPascal xs = ZipWith (+) (xs) (repeat 1)

