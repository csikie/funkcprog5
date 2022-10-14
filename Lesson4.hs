module Lesson4 where

-- lista pattern, lista fgk
-- [] -> lista, [1,2,3,4] :: [Int]
-- header guardok
-- egyszeru rekurzio

head' :: [a] -> a
head' [] = error "Hiba"
head' (x:xs) = x

tail' :: [a] -> [a]
tail' [] = error "Hiba"
tail' (_:xs) = xs

len :: [a] -> Int
len [] = 0
len (_:x) = 1 + len x
-- len [1..3]
-- 1 + len [2,3] -> 1 + (1 + len [3]) -> ... ((1 + 0))

-- [] -> ures lista minta
-- [_] ([x]) -> pontosan egy elemu lista
-- [x,_,y] -> pontosan harom elemu lista
-- [1,2] -> csak az [1,2] listara illeszkedik
-- ((x,_):(_,[]):xs) -> ?
-- (x:xs) -> legalabb 1 elemu
-- (x1:x2:..:xn:xs) -> legalabb n elemu
last' :: [a] -> a
last' [x] = x
last' (_:xs) = last' xs

sum' :: [Int] -> Int
sum' [] = 0
sum' [x] = x
sum' (x:xs) = x + sum' xs

elem' :: Eq a => a -> [a] -> Bool
elem' _ [] = False
elem' a (x:xs) = x == a || elem' a xs

-- zip' [1,2] [True, False] ==> [(1,True), (2, False)]
-- zip' [1,2] [True, False, True] ==> [(1,True), (2, False)]
-- zip' [1,2,3] [True, False] ==> [(1,True), (2, False)]

zip' :: [a] -> [b] -> [(a, b)]
zip' _ [] = []
zip' [] _ = []
zip' (x:xs) (y:ys) = (x,y) : zip' xs ys