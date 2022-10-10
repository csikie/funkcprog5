module Lesson3 where

-- [], (:), (..)
-- [vissza teresi ertek | amibe kiveszem az erteket (x) <- lista, y <- lista2, even x ]

sqroots :: Int -> [Int]
sqroots x = [2^n | n <- [1..x]]

-- evens 10 15 ==> [10,12,14]
evens :: Int -> Int -> [Int]
evens x y = [n | n <- [x..y], even n]

-- (0,0), (0,1), (1,1), (1,2) ... (2,2) ... (6,6)
dominos :: [(Int, Int)]