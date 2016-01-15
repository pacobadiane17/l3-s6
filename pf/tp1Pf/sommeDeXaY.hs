
sommeDeXaY :: Int -> Int -> Int
sommeDeXaY x y = if x>y then 0 
		else x+ sommeDeXaY (x+1) y

somme ::[Int] -> Int
somme[] = 0
somme (x:xs) = x+somme(xs)
 
