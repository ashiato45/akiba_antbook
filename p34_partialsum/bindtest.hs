


f :: [[Int]] -> [Int]
f xs = do
  a <- sequence xs
  return $ sum a


main = do
  let a = [[0, 1], [0, 3], [0, 9]]
  putStrLn $ show $ f a
  
