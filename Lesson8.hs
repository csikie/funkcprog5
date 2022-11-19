module Lesson8 where

type Point = (Int, Int)

p :: Point
p = (0,0)

newtype Point' = P (Int, Int)
  deriving (Show)

data Point'' = P' Int Int | D Double Double
  deriving (Show)

data Day = Mon | Tue | Wed | Thu | Fri | Sat | Sun

isFirstDayOfWeek :: Day -> Bool
isFirstDayOfWeek Mon = True
isFirstDayOfWeek _ = False

isWeekend :: Day -> Bool
isWeekend Sat = True
isWeekend Sun = True
isWeekend _ = False

data Time = T Int Int

showTime :: Time -> String
showTime (T h m) = show h ++ "." ++ show m

eqTime :: Time -> Time -> Bool
eqTime (T h1 m1) (T h2 m2) = h1 == h2 && m1 == m2

isEarlier :: Time -> Time -> Bool
isEarlier (T h1 m1) (T h2 m2) = h1 < h2 || (h1 == h2 && m1 < m2)