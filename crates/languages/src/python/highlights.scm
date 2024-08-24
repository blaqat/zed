(identifier) @variable
(attribute attribute: (identifier) @property)
(type (identifier) @type)
(keyword_argument
	name: (identifier) @variable.parameter
	value: (identifier) @variable)

; Module imports

(import_statement
  (dotted_name (identifier) @type))

(import_statement
  (aliased_import
    name: (dotted_name (identifier) @type)
    alias: (identifier) @type))

(import_from_statement
  (dotted_name (identifier) @type))

(import_from_statement
  (aliased_import
    name: (dotted_name (identifier) @type)
    alias: (identifier) @type))

; Function calls

(decorator) @function

(call
  function: (attribute attribute: (identifier) @function.method))
(call
  function: (identifier) @function)


; Identifier naming conventions

((identifier) @type
 (#match? @type "^[A-Z]"))

((identifier) @constant
 (#match? @constant "^_*[A-Z][A-Z\\d_]*$"))

; Builtin functions and types
((identifier) @function.builtin
	(#match?
   @function.builtin
   "^(abs|all|any|ascii|bin|breakpoint|bytearray|bytes|callable|chr|classmethod|compile|complex|delattr|dict|dir|divmod|enumerate|eval|exec|filter|float|format|frozenset|getattr|globals|hasattr|hash|help|hex|id|input|int|isinstance|issubclass|iter|len|list|locals|map|max|memoryview|min|next|object|oct|open|ord|pow|print|property|range|repr|reversed|round|set|setattr|slice|sorted|staticmethod|str|sum|super|tuple|type|vars|zip|__import__)$")
	)

((identifier) @type.builtin
	(#match?
   @type.builtin
   "^(list|dict|tuple|set|bytes|bytearray|memoryview|range|frozenset|object)$")
	)

((identifier) @type.builtin.primative
	(#match?
   @type.builtin.primative
   "^(int|float|str|bool|complex)$")
	)

((call
  function: (identifier) @function.builtin)
 (#match?
   @function.builtin
   "^(abs|all|any|ascii|bin|bool|breakpoint|bytearray|bytes|callable|chr|classmethod|compile|complex|delattr|dict|dir|divmod|enumerate|eval|exec|filter|float|format|frozenset|getattr|globals|hasattr|hash|help|hex|id|input|int|isinstance|issubclass|iter|len|list|locals|map|max|memoryview|min|next|object|oct|open|ord|pow|print|property|range|repr|reversed|round|set|setattr|slice|sorted|staticmethod|str|sum|super|tuple|type|vars|zip|__import__)$")
 )

; Function definitions

(function_definition
  name: (identifier) @function.declaration)

; Literals
[
  (none)
] @constant.builtin

[
	(true)
  (false)
] @boolean

[
  (integer)
  (float)
] @number

; Self references

[
  (parameters (identifier) @variable.parameter)
  (typed_parameter (identifier) @variable.parameter)
  (attribute (identifier) @variable.special)
  (#match? @variable.special "^self$")
]

(comment) @comment
(string) @string
(escape_sequence) @escape

[
  "("
  ")"
  "["
  "]"
  "{"
  "}"
] @punctuation.bracket

(interpolation
  "{" @punctuation.special
  "}" @punctuation.special) @embedded

[
	"->"
	","
	":"
] @punctuation.delimiter

; Docstrings.
(function_definition
  "async"?
  "def"
  name: (_)
  (parameters)?
  body: (block
    (expression_statement (string
    	((string_start) @comment.doc.
    	(string_content) @comment.doc
    	(string_end) @comment.doc.
     (#eq? @comment.doc. "\"\"\""))
    ))
  )
)

(class_definition
  body: (block
    (expression_statement (string
    	(string_start) @comment.doc.
    	(string_content) @comment.doc
    	(string_end) @comment.doc.
     (#eq? @comment.doc. "\"\"\"")))))

[
  "-"
  "*"
  "**"
  "/"
  "//"
  "%"
  "^"
  "+"
] @operator.arithmetic

[
	"not"
	"and"
	"or"
] @operator.logical

[
	"="
	"-="
  "//="
  "/="
	"**="
  "*="
	"%="
	"+="
	":="
] @operator.assignment

[
	"^"
	"|"
	"&"
	"<<"
	">>"
	"~"
] @operator.bitwise

[
	"is"
	"is not"
	"=="
	"!="
	"!="
	"<"
	">"
	"<="
	">="
	"<>"
] @operator.comparison

[
  "as"
  "class"
  "def"
  "del"
  "exec"
  "from"
  "global"
  "import"
  "lambda"
  "nonlocal"
  "pass"
  "print"
  "yield"
  "in"
  "not in"
] @keyword

[
  "assert"
  "async"
  "await"
  "break"
  "continue"
  "elif"
  "else"
  "except"
  "finally"
  "for"
  "if"
  "raise"
  "return"
  "try"
  "while"
  "with"
  "match"
  "case"
] @keyword.control
