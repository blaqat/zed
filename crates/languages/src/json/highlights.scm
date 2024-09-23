(comment) @comment

(string) @string
(escape_sequence) @string.escape

(pair
  key: (string) @property.json_key)

(number) @number

[
  (null)
] @constant.builtin

[
	(true)
  (false)
] @boolean

[
  "{"
  "}"
  "["
  "]"
] @punctuation.bracket

[
	","
	":"
] @punctuation.delimiter

; "\"" @punctuation
