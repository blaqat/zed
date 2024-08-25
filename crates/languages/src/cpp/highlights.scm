(identifier) @variable
(field_identifier) @property

(call_expression
  function: (qualified_identifier
    name: (identifier) @function))

(call_expression
  function: (identifier) @function)

(call_expression
  function: (field_expression
    field: (field_identifier) @function))

(preproc_function_def
  name: (identifier) @function.special)

(template_function
  name: (identifier) @function)

(template_method
  name: (field_identifier) @function)

(function_declarator
  declarator: (identifier) @function)

(function_declarator
  declarator: (qualified_identifier
    name: (identifier) @function))

(function_declarator
  declarator: (field_identifier) @function)

(operator_name
  (identifier)? @operator) @function

(destructor_name (identifier) @function)

((namespace_identifier) @type
 (#match? @type "^[A-Z]"))

(auto) @type
(type_identifier) @type

((identifier) @constant
 (#match? @constant "^_*[A-Z][A-Z\\d_]*$"))

(statement_identifier) @label
(this) @variable.special
("static_assert") @function.builtin

[
  "alignas"
  "alignof"
  "class"
  "concept"
  "constexpr"
  "decltype"
  "delete"
  "enum"
  "explicit"
  "extern"
  "final"
  "friend"
  "inline"
  "namespace"
  "new"
  "noexcept"
  "override"
  "private"
  "protected"
  "public"
  "requires"
  "sizeof"
  "struct"
  "template"
  "typedef"
  "typename"
  "union"
  "using"
  "primitive_type"
  "sized_type_specifier"
  "storage_class_specifier"
  "type_qualifier"
  "virtual"
] @keyword

[
  "break"
  "case"
  "catch"
  "co_await"
  "co_return"
  "co_yield"
  "continue"
  "default"
  "do"
  "else"
  "for"
  "if"
  "return"
  "switch"
  "throw"
  "try"
  "while"
] @keyword.control

[
  "#define"
  "#elif"
  "#else"
  "#endif"
  "#if"
  "#ifdef"
  "#ifndef"
  "#include"
  (preproc_directive)
] @keyword.special

(comment) @comment

[
  (null)
  ("nullptr")
] @constant

[
	(true)
  (false)
] @boolean

(number_literal) @number

[
  (string_literal)
  (system_lib_string)
  (char_literal)
  (raw_string_literal)
] @string

[
  ","
  ":"
  "::"
  ";"
  (raw_string_delimiter)
] @punctuation.delimiter

[
  "{"
  "}"
  "("
  ")"
  "["
  "]"
] @punctuation.bracket

[
  "."
  ".*"
  "->*"
  "~"
  "?"
] @operator

[
	"!"
  "||"
  "&&"
] @operator.logical

[
  "|"
  "^"
  "&"
  "<<"
  ">>"
] @operator.bitwise

[
  "="
  "--"
  "++"
  "^="
	"|="
	"<<="
  ">>="
  "-="
  "&="
  "+="
  "*="
  "/="
  "%="
] @operator.assignment

[
  "-"
  "+"
  "*"
  "/"
  "%"
] @operator.arithmetic

[
  "!="
  "<"
  "=="
  ">"
  "<="
  ">="
  "<=>"
] @operator.comparison

(conditional_expression ":" @operator)
(user_defined_literal (literal_suffix) @operator)
