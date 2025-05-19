{-# OPTIONS_GHC -Wmissing-signatures #-}

import Html.Internal
    ( Html, html_, ul_, ol_, code_, p_, render )

main :: IO ()
main = writeFile "build/index.html" (render page)

page :: Html
page =
  html_
    "my title"
    (
        code_ "print('hello world')" <>
        (
            p_ "p1" <>
            ul_
                [ p_ "list",
                  p_ "lmao",
                  ol_ [p_ "ordered", p_ "lol"]
                ]
        )
    )
