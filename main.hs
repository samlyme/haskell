{-# OPTIONS_GHC -Wmissing-signatures #-}

import Html

main :: IO ()
main = writeFile "build/index.html" (render page)

page :: Html
page =
  html_
    "my title"
    ( append_
        (code_ "print('hello world')")
        ( append_
            (p_ "p1")
            ( ul_
                [ p_ "list",
                  p_ "lmao",
                  ol_ [p_ "ordered", p_ "lol"]
                ]
            )
        )
    )
