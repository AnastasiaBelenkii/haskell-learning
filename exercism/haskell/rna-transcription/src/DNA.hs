module DNA (toRNA) where

import Data.HashMap.Lazy as Map (fromList, lookup)

toRNA :: String -> Either Char String
toRNA = traverse $ \c -> maybe (Left c) Right (Map.lookup c rnaMap)
  where
    rnaMap = Map.fromList [('G', 'C'), ('C', 'G'), ('T', 'A'), ('A', 'U')]