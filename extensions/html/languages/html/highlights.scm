(tag_name) @tag
(erroneous_end_tag_name) @tag.error
(doctype) @tag.doctype
(attribute_name) @attribute
(attribute_value) @string
(comment) @comment

"=" @operator
"\"" @operator

[
  "<"
  ">"
  "<!"
  "</"
  "/>"
] @punctuation.bracket.tag
