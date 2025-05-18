{-# OPTIONS_GHC -Wmissing-signatures #-}
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

{-# HLINT ignore "Avoid lambda" #-}

main :: IO ()
main =
  putStrLn
    (makeHtml "My page title" ("Cool number: " <> show 3))

three :: Int
three = (\a b -> a + b) 2 1

makeHtml :: String -> String -> String
makeHtml title content =
  html_
    ( head_ (title_ title) <> body_ content
    )

html_ :: String -> String
html_ = el "html"

body_ :: String -> String
body_ = el "body"

head_ :: String -> String
head_ = el "head"

title_ :: String -> String
title_ = el "title"

p_ :: String -> String
p_ = el "p"

h1_ :: String -> String
h1_ = el "h1"

el :: String -> String -> String
el tag content = "<" <> tag <> ">" <> content <> "</" <> tag <> ">"