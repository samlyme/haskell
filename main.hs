{-# OPTIONS_GHC -Wmissing-signatures #-}
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

{-# HLINT ignore "Avoid lambda" #-}

main :: IO ()
main = putStrLn (render page)

page :: Html
page =
  html_
    "my title"
    ( append_
        (h1_ "urmom")
        ( append_
            (p_ "p1")
            (p_ "p2")
        )
    )

newtype Html = Html String

newtype Structure = Structure String

type Title = String

html_ :: String -> Structure -> Html
html_ title content =
  Html
    ( el
        "html"
        ( el "head" (el "title" title)
            <> el "body" (getStructureString content)
        )
    )

p_ :: String -> Structure
p_ = Structure . el "p"

h1_ :: String -> Structure
h1_ = Structure . el "h1"

el :: String -> String -> String
el tag content = "<" <> tag <> ">" <> content <> "</" <> tag <> ">"

-- If you squint, (Structure str) is how we create a variable of type Structure
-- Since everything is functional, having this definition in the args
-- gives us access to the underlying data.
getStructureString :: Structure -> String
getStructureString (Structure str) = str

append_ :: Structure -> Structure -> Structure
append_ (Structure a) (Structure b) = Structure (a <> b)

render :: Html -> String
render (Html a) = a