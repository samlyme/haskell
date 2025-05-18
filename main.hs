{-# OPTIONS_GHC -Wmissing-signatures #-}

import Html

main :: IO ()
main = writeFile "build/index.html" (render page)

page :: Html
page =
  html_
    "my title"
    ( append_
        (h1_ "<p> broken!")
        ( append_
            (p_ "p1")
            (ul_ [p_ "list", p_ "lmao"])
        )
    )
