-- Case { factors  = [3]
--                , limit    = 7
--                , expected = 9
--                , description = "more than one multiple within limit"
--                }

module SumOfMultiples (sumOfMultiples) where

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit
    | [limit] < factors = 0
    | factors == [0] = 0
    | otherwise = sum $ filter (\y -> any (\x -> y `mod` x == 0) sanitizedFactors) [0..limit-1]
    where sanitizedFactors = filter (/= 0) factors