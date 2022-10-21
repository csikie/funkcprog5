module Lesson5 where

--- | logikai kifejezes = utasitas
--- ...
--- ...



replaceAll :: Eq a => a -> a -> [a] -> [a]
replaceAll _ _ [] = []
replaceAll a x (b:bs)
  | a == b = x : replaceAll a x bs
  | otherwise = b : replaceAll a x bs

repeat' :: a -> [a]
repeat' x = x : repeat' x

take' :: Int -> [a] -> [a]
take' 0 _ = []
take' _ [] = []
take' n _
  | n < 0 = []
take' n (x:xs) = x : take' (n-1) xs