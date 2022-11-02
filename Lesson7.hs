module Lesson7 where

import Data.List

hasAny :: Eq a => [a] -> [a] -> Bool
hasAny _ [] = False
hasAny [] _ = False
hasAny (x:xs) l = any (==x) l || hasAny xs l

takeWhile' :: (a -> Bool) -> [a] -> [a]
takeWhile' _ [] = []
takeWhile' f (x:xs)
  | f x = x : takeWhile' f xs
  | otherwise = []

dropWhile' :: (a -> Bool) -> [a] -> [a]
dropWhile' _ [] = []
dropWhile' f l@(x:xs)
  | f x = dropWhile' f xs
  | otherwise = l

-- "" -> String
-- '' -> Karakter
dropWord :: String -> String
dropWord [] = []
dropWord s = dropWhile' (/= ' ') s

dropSpaces :: String -> String
dropSpaces [] = []
dropSpaces s = dropWhile (== ' ') s

trim :: String -> String
-- trim s = reverse (dropSpaces (reverse (dropSpaces s)))
trim = reverse . dropSpaces . reverse . dropSpaces

monogram :: String -> String
monogram s = unwords (map (\(x:_) -> x : ".") (words s))

uniq :: Ord a => [a] -> [a]
--uniq s =  map head (group (sort s))
uniq = map head . group . sort