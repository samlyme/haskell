module Markup
  ( Document,
    Structure (..),
  )
where

import Numeric.Natural

type Document = [Structure]

data Structure
  = Heading Natural String
  | Paragraph String
  | UnorderedList [String]
  | OrderedList [String]
  | CodeBlock [String]

example1 = Paragraph "Hello, world!"

example2 = [Heading 1 "Welcome", Paragraph "To this tutorial about Haskell."]

example3 =
  [ Paragraph "Remember that multiple lines with no separation are grouped together into a single paragraph but list items remain separate.",
    OrderedList ["Item 1 of a list", "Iem 2 of the same list"]
  ]