module Lesson2 where

-- (x1, x2, ..., xn)
-- (4, 6) ==> (Int, Int)
-- (1, 'c', "hello", True, 43.21, (90, 4)) ==> (Int, Char, String, Bool, Double, (Int, Int))
-- (even, odd)


-- (4,3,1) = True
-- (4,5,6) = False
thirdIsOne :: (Int, Int, Int) -> Bool
thirdIsOne (_, _, 1) = True
thirdIsOne _ = False

swap :: (Int, Int) -> (Int, Int)
swap (a, b) = (b, a)

-- abs (a - b)
distance :: (Int, Int) -> Int
distance (x, y) = abs (x - y)

-- triplicate 42 == (42,42,42)
triplicate :: Int -> (Int, Int, Int)
triplicate x = (x, x, x)

-- doubleTheTuple (42, True) == ((42, True), (42, True))
doubleTheTuple :: (Int, Bool) -> ((Int, Bool), (Int, Bool))
doubleTheTuple x = (x, x)