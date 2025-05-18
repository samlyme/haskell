{-# OPTIONS_GHC -Wmissing-signatures #-}
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use concatMap" #-}

module Html (
  Html,
  Title,
  Structure,
  html_,
  p_,
  h1_,
  append_,
  render
) where

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
  let 
    escapeChar c = 
      case c of
        '<' -> "&lt;"
        '>' -> "&gt;"
        '&' -> "&amp;"
        '"' -> "&quot;"
        '\'' -> "&#39;"
        _ -> [c]
  in
    concat . map escapeChar

append_ :: Structure -> Structure -> Structure
append_ (Structure a) (Structure b) = Structure (a <> b)

render :: Html -> String
render (Html a) = a