import Control.Monad.Reader
import Control.Monad.Writer
import Control.Applicative

data GivenData = GivenData{l :: Int, ants :: [Int]}

calc :: Reader GivenData (Int, Int)
calc = do
  l <- l <$> ask
  ants <- ants <$> ask
  let a = (min <$> (l - ) <*> id) <$> ants
  let b = (max <$> (l - ) <*> id) <$> ants
  return $ (maximum a, maximum b)

output :: (Int, Int) -> Writer String ()
output x = do
  tell $ "min = "
  tell $ show $ fst x
  tell $ "\n"
  tell $ "max = "
  tell $ show $ snd x
  return ()

main = do
  l <- (read :: String -> Int) <$> getLine
  _ <- getLine
  ants <- (((read :: String -> Int) <$>).words) <$> getLine
  let calced = runReader calc GivenData{l = l, ants = ants}
  putStrLn $ execWriter $ output calced
     