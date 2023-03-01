module CollatzConjecture (collatz) where

collatz :: Integer -> Maybe Integer
collatz n | n <= 0 = Nothing
          | n == 1 = Just 0
          | even n     = succ <$> collatz (n `div` 2)
          | otherwise  = succ <$> collatz (3 * n + 1)

-- notes on modul's solution (above):
-- <$> is fmap, which has signature
-- (a->b) -> fa -> fb : in other words given an a->b
-- and an object of type fa it will open the fa and
-- give you an fb

-- here we are using it to "open" the Maybe returned
-- by collatz and apply the successor function to the Integer
-- inside: basically we just recursively apply succ
-- (ie increment by one) until we hit 1