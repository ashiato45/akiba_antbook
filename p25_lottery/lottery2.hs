import Control.Applicative
import Data.List

data Splitted a = Splitted{pivot :: a, left :: [a], right :: [a]}

splitCenter :: (Ord a) => [a] -> Splitted a
splitCenter [] = error "splitted blank!"
splitCenter xs = let n = length xs
                     left = take (n `div` 2) xs
                     right' = drop (n `div` 2) xs
                 in Splitted{pivot = head right', left=left, right=tail right'}
    
binSearch :: (Ord a) => a -> [a] -> Bool
binSearch _ [] = False
binSearch x xs = let s = splitCenter xs
                 in if pivot s == x
                    then True
                    else or $ (binSearch x) <$> [left s, right s]

check' :: Int -> [Int] -> [[Int]]
check' t xs = do
  a <- xs
  b <- [x | x <- xs, x >= a]
  c <- [x | x <- xs, x >= b]
  let d = t - a - b - c
  if binSearch d xs
  then return [a, b, c, d]
  else fail "No answer"
  

check :: Int -> [Int] -> Bool
check t xs = (/= [[]]) $ check' t xs

main = do
  _ <- getLine
  target <- (read :: String -> Int) <$> getLine
  pieces <- (sort.((read :: String -> Int) <$>).words) <$> getLine
  putStrLn $ show $ check' target pieces