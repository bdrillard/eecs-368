{--
 - Aleksander Eskilson, 2373732
 - HW 7
 - A function to determine if a given binary tree is balanced
 --}
data Tree = Leaf Int | Node Tree Int Tree deriving Show

balanced :: Tree -> Bool
balanced (Leaf _) = True
balanced (Node left _ right) =  (balanced left)
                                && (balanced right)
                                && abs ((height left) - (height right)) <= 1 

-- Helper function, finds height of a tree
height :: Tree -> Int
height (Leaf _) = 0
height (Node left _ right) = 1 + max (height left) (height right)

-- balanced (Leaf 1)
-- True
-- balanced (Node (Leaf 2) 1 (Leaf 3))
-- True
-- balanced (Node (Node (Leaf 4) 2 (Leaf 5)) 1 (Leaf 3))
-- True
-- balanced (Node (Node (Node (Leaf 6) 4 (Leaf 7)) 2 (Leaf 5)) 1 (Leaf 3))
-- False
-- balanced (Node (Node (Leaf 4) 2 (Leaf 5)) 1 (Node (Leaf 6) 3 (Leaf 7)))
-- True
-- balanced (Node (Leaf 2) 1 (Node (Leaf 4) 2 (Leaf 3)))
-- True
-- balanced (Node (Leaf 2) 1 (Node (Leaf 5) 3 (Node (Leaf 6) 4 (Leaf 7))))
-- False
