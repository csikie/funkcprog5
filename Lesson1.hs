module Lesson1 where

hello :: String
hello = "Hello World!"

x :: Int
x = 42

letter :: Char
letter = 'A'

isEven :: Int -> Bool
isEven x = mod x 2 == 0

isOdd :: Int -> Bool
isOdd x = mod x 2 == 1

isOdd' :: Int -> Bool
isOdd' x = not (isEven x)

-- (+), (*), mod, div, >,<,
-- Bool: (||), (&&)

add :: Int -> (Int -> Int)
add a = (a+)