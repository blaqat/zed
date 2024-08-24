(identifier) @variable
(type_identifier) @type
(field_identifier) @property
(package_identifier) @variable.special
(parameter_declaration (identifier) @variable.parameter)
(variadic_parameter_declaration (identifier) @variable.parameter)

((type_identifier) @type.builtin.primitive
	(#match? @type.builtin.primitive "^(bool|byte|complex(64|128)|float(32|64)|int(8|16|32|64|)?|uint(8|16|32|64)?|rune|string|uintptr)$"))

((type_identifier) @type.builtin
	(#match? @type.builtin "^(error|chan|any)$"))

((identifier) @variable.builtin
	(#match? @variable.builtin "^(fmt|errors|io|os|http|json|time|math|strings|sync|net|http|bufio|bytes|flag|log|regexp|sort|strconv|testing|text|unicode|context|reflect|crypto|image|mime|path|runtime|signal|syscall|template)$"))

(_
	receiver: (_ (parameter_declaration
			(identifier) @variable.special)))

(keyed_element
  .
  (literal_element
    (identifier) @property))

(call_expression
  function: (identifier) @function)

(call_expression (identifier) @function.builtin
	(#match? @function.builtin "^(make|append|copy|delete|len|cap|new|complex|real|imag|close|panic|recover|print|println)$"))

(call_expression
  function: (selector_expression
    field: (field_identifier) @function.method))

(function_declaration
  name: (identifier) @function.declaration)

(method_declaration
  name: (field_identifier) @function.method)

[
  "("
  ")"
  "{"
  "}"
  "["
  "]"
] @punctuation.bracket

[
	"."
	","
	":"
	";"
] @punctuation.delimiter

[
  "-"
  "*"
  "/"
  "%"
  "+"
] @operator.arithmetic

[
  "&&"
  "||"
  "!"
] @operator.logical

[
  "&"
  "|"
  "^"
  "~"
  "<<"
  ">>"
] @operator.bitwise

[
  "="
  "--"
  ":="
  "-="
  "*="
  "/="
  "&="
  "%="
  "^="
  "+="
  "<<="
  ">>="
  "|="
] @operator.assignment

[
  "!="
  "<"
  "<="
  "=="
  ">"
  ">="
] @operator.comparison

[
  "..."
  "<-"
] @operator

[
  "chan"
  "const"
  "default"
  "func"
  "import"
  "package"
  "type"
  "var"
] @keyword

[
	(struct_type)
	(interface_type)
	(map_type)
	(function_type)
] @keyword.special

[
  "break"
  "case"
  "continue"
  "defer"
  "else"
  "fallthrough"
  "for"
  "go"
  "goto"
  "if"
  "range"
  "return"
  "select"
  "switch"
] @keyword.control

[
  (interpreted_string_literal)
  (raw_string_literal)
  (rune_literal)
] @string

(escape_sequence) @escape

[
  (int_literal)
  (float_literal)
  (imaginary_literal)
] @number

(const_spec
  name: (identifier) @constant)

[
  (nil)
  (iota)
] @constant.builtin

[
	(true)
  (false)
] @boolean

(comment) @comment
