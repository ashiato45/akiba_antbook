import Control.Applicative

check' :: Int -> [Int] -> [[Int]]
check' t xs = do
  a <- xs
  b <- [x | x <- xs, x >= a]
  c <- [x | x <- xs, x >= b]
  d <- [x | x <- xs, x >= c]
  if (a + b + c + d) == t
  then return [a, b, c, d]
  else fail "No answer"
  

check :: Int -> [Int] -> Bool
check t xs = (/= [[]]) $ check' t xs

main = do
  _ <- getLine
  target <- (read :: String -> Int) <$> getLine
  pieces <- (((read :: String -> Int) <$>).words) <$> getLine
  putStrLn $ show $ check' target pieces