{-# OPTIONS_GHC -Wmissing-signatures #-}
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

{-# HLINT ignore "Avoid lambda" #-}

main :: IO ()
main =
  putStrLn
    (makeHtml "My page title" ("Cool number: " <> show 3))

newtype Html = Html String

newtype Structure = Structure String

-- If you squint, (Structure str) is how we create a variable of type Structure
-- Since everything is functional, having this definition in the args
-- gives us access to the underlying data.
getStructureString :: Structure -> String
getStructureString (Structure str) = str

three :: Int
three = (\a b -> a + b) 2 1

makeHtml :: String -> String -> String
makeHtml title content =
  getStructureString
    ( html_
        ( getStructureString (append_ (title_ title) (body_ content))
        )
    )

append_ :: Structure -> Structure -> Structure
append_ (Structure a) (Structure b) = Structure (a <> b)

html_ :: String -> Structure
html_ = Structure . el "html"

body_ :: String -> Structure
body_ = Structure . el "body"

head_ :: String -> Structure
head_ = Structure . el "head"

title_ :: String -> Structure
title_ = Structure . el "title"

p_ :: String -> Structure
p_ = Structure . el "p"

h1_ :: String -> Structure
h1_ = Structure . el "h1"

el :: String -> String -> String
el tag content = "<" <> tag <> ">" <> content <> "</" <> tag <> ">"