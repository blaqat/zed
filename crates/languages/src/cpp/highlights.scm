(identifier) @variable
(field_identifier) @property
(namespace_identifier) @namespace

(concept_definition
    (identifier) @concept)


(call_expression
  function: (qualified_identifier
    name: (identifier) @function))

(call_expression
  (qualified_identifier
    (identifier) @function.call))

(call_expression
  (qualified_identifier
    (qualified_identifier
      (identifier) @function.call)))

(call_expression
  (qualified_identifier
    (qualified_identifier
      (qualified_identifier
        (identifier) @function.call))))

((qualified_identifier
  (qualified_identifier
    (qualified_identifier
      (qualified_identifier
        (identifier) @function.call)))) @_parent
  (#has-ancestor? @_parent call_expression))

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
type :(primitive_type) @type.primitive

(requires_clause
    constraint: (template_type
        name: (type_identifier) @concept))

(attribute
    name: (identifier) @keyword)

((identifier) @constant
 (#match? @constant "^_*[A-Z][A-Z\\d_]*$"))

(statement_identifier) @label
(this) @variable.special
("static_assert") @function.builtin

[
  "alignas" "alignof" "constexpr" "explicit" "final" "friend" "inline" "mutable"
  "noexcept" "override" "private" "protected" "public"
] @keyword.modifier

[
  "class" "struct" "union" "enum" "typename" "template" "namespace"
] @keyword.typedef

[
  "new" "delete" "sizeof"
] @keyword.op

[
  "using"
] @keyword.import

[
  "break" "continue" "return"
] @keyword.return

[
  "if" "else" "switch" "case" "default"
] @keyword.conditional

[
  "for" "while" "do"
] @keyword.repeat

[
  "try" "catch" "throw"
] @keyword.exception

[
  "co_await" "co_return" "co_yield"
] @keyword.coroutine

[
  "#define" "#elif" "#else" "#endif" "#if" "#ifdef" "#ifndef" "#include"
  (preproc_directive)
] @keyword.directive

[
  "typedef" "concept" "requires" "decltype" "extern"
] @keyword

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

[
  (type_identifier)
] @type

[
	(primitive_type)
	(sized_type_specifier)
] @type.builtin

((primitive_type) @type.builtin.primitive
	(#match? @type.builtin.primitive "^(void|char|short|int|long|float|double)$"))
