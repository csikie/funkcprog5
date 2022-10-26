module Lesson6 where

import Data.Char

-- lambda fg
-- \(x:xs) (y,z) -> fg torzs 

map' :: (a -> b) -> [a] -> [b]
map' _ [] = []
map' f (x:xs) =  f x : map' f xs
-- map' f l = [f x| x <- l]

filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' f (x:xs)
  | f x = x : filter' f xs
  | otherwise = filter' f xs

-- people.inf.elte.hu/poor_a

upperToLower :: String -> String
upperToLower s = map toLower (filter isUpper s)

all' :: (a -> Bool) -> [a] -> Bool
all' f l = and (map f l)

any' :: (a -> Bool) -> [a] -> Bool
any' f l = or (map f l)

hasLongLines :: String -> Bool
hasLongLines s = any (>=3) (map length (map words (lines s)))

users :: [(String, String)]
users = [("mrbean", "4321"), ("admin", "s3cr3t"), ("finn", "algebraic")]

doesUserExist :: String -> [(String, String)] -> Bool
doesUserExist u l = any (==u) (map fst l)