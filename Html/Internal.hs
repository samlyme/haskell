{-# OPTIONS_GHC -Wmissing-signatures #-}
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

{-# HLINT ignore "Use concatMap" #-}

module Html.Internal where

newtype Html = Html String

newtype Structure = Structure String

type Title = String

html_ :: String -> Structure -> Html
html_ title content =
  Html
    ( el
        "html"
        ( el "head" (el "title" (escape title))
            <> el "body" (getStructureString content)
        )
    )

ul_ :: [Structure] -> Structure
ul_ =
  let li_ = el "li"
   in Structure . el "ul" . concat . map (li_ . getStructureString)

-- Same behavior
ol_ :: [Structure] -> Structure
ol_ items =
  let li_ = el "li"
   in Structure (el "ol" (concat (map (li_ . getStructureString) items)))

code_ :: [Char] -> Structure
code_ = Structure . el "pre" . escape

p_ :: String -> Structure
p_ = Structure . el "p" . escape

h1_ :: String -> Structure
h1_ = Structure . el "h1" . escape

el :: String -> String -> String
el tag content = "<" <> tag <> ">" <> content <> "</" <> tag <> ">"

-- If you squint, (Structure str) is how we create a variable of type Structure
-- Since everything is functional, having this definition in the args
-- gives us access to the underlying data.
getStructureString :: Structure -> String
getStructureString (Structure str) = str

escape :: [Char] -> [Char]
escape =
  let escapeChar c =
        case c of
          '<' -> "&lt;"
          '>' -> "&gt;"
          '&' -> "&amp;"
          '"' -> "&quot;"
          '\'' -> "&#39;"
          _ -> [c]
   in concat . map escapeChar

instance Semigroup Structure where
  (<>) :: Structure -> Structure -> Structure
  (<>) a b =
    Structure (getStructureString a <> getStructureString b)

render :: Html -> String
render (Html a) = a