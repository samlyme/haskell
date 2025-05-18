{-# OPTIONS_GHC -Wmissing-signatures #-}

import Prelude hiding (even, odd, replicate)

replicate :: Int -> a -> [a]
replicate n val =
  if n > 0
    then val : replicate (n-1) val
    else []

even :: Int -> Bool
even n =
  if n == 0
    then True
    else odd (n - 1)

-- More concise 
odd :: Int -> Bool
odd n =
  (n == 0) || even (n - 1)