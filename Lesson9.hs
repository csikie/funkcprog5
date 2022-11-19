module Lesson9 where

data Privilege = Unprivileged | Admin
  deriving (Show, Eq)

data Cookie = LoggedIn String Privilege | LoggedOut
  deriving (Show, Eq)

type DB = [(String, String, Privilege)]

db :: DB
db = [("dumbledore","abracadabra",Unprivileged), ("root", "secret", Admin), ("bela", "korte", Unprivileged)]

register :: String -> String -> Cookie -> DB -> DB
register u p (LoggedIn _ Admin) l = (u, p, Unprivileged) : l
register _ _ _ l = l

-- data Maybe a = Just a | Nothing
-- data Either a b c = Left a | Right b

safeDiv :: Int -> Int -> Maybe Int
safeDiv _ 0 = Nothing
safeDiv a b = Just (div a b)

getUser :: String -> DB -> Maybe (String, Privilege)
getUser _ [] = Nothing
getUser username ((u, p, priv):xs)
  | username == u = Just (p, priv)
  | otherwise = getUser username xs

login :: String -> String -> DB -> Cookie
login _ _ [] = LoggedOut
login u p ((u2,p2, priv):xs)
  | u == u2 && p == p2 = LoggedIn u priv
  | otherwise = login u p xs

passwd :: String -> Cookie -> DB -> DB
passwd _ _ [] = []
passwd _ LoggedOut l = l
passwd newpw c@(LoggedIn u _) ((u2,pw,priv):xs)
  | u == u2 = (u,newpw,priv) : xs
  | otherwise = (u2,pw,priv) : passwd newpw c xs

delete :: String -> Cookie -> DB -> DB
delete _ LoggedOut l = l
delete _ (LoggedIn _ Unprivileged) l = l
delete u (LoggedIn _ Admin) l = filter (\(u2,_,_) -> u /= u2) l

users :: DB -> [String]
users l = map (\(u,_,_) -> u) l