import Control.Applicative

getValidCom :: Int -> [Int] -> [[Int]]
getValidCom target xs = do
  ss <- sequence $ (\x -> [0, x]) <$> xs
  if sum ss == target
  then return ss
  else fail "No"

yesno :: Bool -> String
yesno False = "NO"
yesno True = "YES"
    
main = do
  _ <- getLine
  numbers <- (((read :: String -> Int)<$>).words) <$> getLine
  target <- (read :: String -> Int) <$> getLine
  --  putStrLn $ show $ getValidCom target numbers
  putStrLn $ yesno (getValidCom target numbers /= [])