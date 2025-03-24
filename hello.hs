main = putStrLn myHtml

myHtml = makeHtml "My Page Title" (h1_ "Welcome!" <> p_ "Lorem")

makeHtml title body =
  html_
    ( head_
        (title_ title <> body_ body)
    )

el :: String -> String -> String
el tag content =
  "<" <> tag <> ">" <> content <> "</" <> tag <> ">"

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