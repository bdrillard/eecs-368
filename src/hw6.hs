{-
 - Aleksander Eskilson, 2373732
 - hw5.hs
 - Accepts two sorted list, outputs a single sorted list
-}
merge :: Ord a => [a] -> [a] -> [a]
merge xs []         = xs 
merge [] ys         = ys
merge (x:xs) (y:ys) = if x < y
                        then x : merge xs (y:ys) 
                        else y : merge (x:xs) ys

-- merge [2,5,6] [1,3,4]
-- [1,2,3,4,5,6]
-- merge [1,2,3] [4,5,6]
-- [1,2,3,4,5,6]
-- merge [4,5,6] [1,2,3]
-- [1,2,3,4,5,6]
-- merge [1,2,5] [3,4,5]
-- [1,2,3,4,5,5]
-- merge [1,3] [2]
-- [1,2,3]
-- merge [2] [1,3]
-- [1,2,3]
-- merge [] [1,2]
-- [1,2]
-- merge [] [1]
-- [1]
-- merge [] []
-- []
-- merge ['a','c','e'] ['b','d','f']
-- "abcdef"
