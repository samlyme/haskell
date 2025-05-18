{-# OPTIONS_GHC -Wmissing-signatures #-}

import Html ( Html, html_, p_, h1_, append_, render )

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
            (p_ "p2")
        )
    )
