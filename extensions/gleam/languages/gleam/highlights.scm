; Comments
(module_comment) @comment
(statement_comment) @comment
(comment) @comment

; Constants
(constant
  name: (identifier) @constant)

; Variables
(identifier) @variable
(discard) @comment.unused

; Modules
(module) @module
(import alias: (identifier) @module)
(remote_type_identifier
  module: (identifier) @module)
(remote_constructor_name
  module: (identifier) @module)
((field_access
  record: (identifier) @module
  field: (label) @function)
 (#is-not? local))

; Functions
(unqualified_import (identifier) @function)
(unqualified_import "type" (type_identifier) @type)
(unqualified_import (type_identifier) @constructor)
(function
  name: (identifier) @function.declaration)
(external_function
  name: (identifier) @function)
(function_parameter
  name: (identifier) @variable.parameter)
((function_call
   function: (identifier) @function)
 (#is-not? local))
((binary_expression
   operator: "|>"
   right: (identifier) @function)
 (#is-not? local))

; "Properties"
; Assumed to be intended to refer to a name for a field; something that comes
; before ":" or after "."
; e.g. record field names, tuple indices, names for named arguments, etc
(label) @property
(tuple_access
  index: (integer) @property)

; Attributes
(attribute
  "@" @attribute
  name: (identifier) @attribute)

(attribute_value (identifier) @constant)

; Type names
(remote_type_identifier) @type
(type_identifier) @type

; Data constructors
(constructor_name) @type
((constructor_name) @boolean
 (#any-of? @boolean "True" "False"))
((constructor_name) @constant.builtin
 (#any-of? @constant.builtin "Nil" "Nothing" "Ok" "Error"))
((constructor_name) @type.builtin.primitive
 (#any-of? @type.builtin.primitive "Int" "Float" "Char" "String" "Bool" "Atom"))
((constructor_name) @type.builtin
 (#any-of? @type.builtin "List" "Maybe" "Result" "Tuple" "Option" "Set" "Map" "BitArray"))

; Literals
(string) @string
((escape_sequence) @warning
 ; Deprecated in v0.33.0-rc2:
 (#eq? @warning "\\e"))
(escape_sequence) @string.escape
(bit_string_segment_option) @function.builtin
(integer) @number
(float) @number

; Reserved identifiers
; TODO: when tree-sitter supports `#any-of?` in the Rust bindings,
; refactor this to use `#any-of?` rather than `#match?`
((identifier) @warning
 (#match? @warning "^(auto|delegate|derive|else|implement|macro|test|echo)$"))

; Keywords
[
  "assert"
  "case"
  "if"
] @keyword.control

[
  (visibility_modifier) ; "pub"
  (opacity_modifier) ; "opaque"
  "as"
  "const"
  ; DEPRECATED: 'external' was removed in v0.30.
  "external"
  "fn"
  "import"
  "let"
  "panic"
  "todo"
  "type"
  "use"
] @keyword

; Operators
(binary_expression
  operator: _ @operator)
(boolean_negation "!" @operator.logical)
(integer_negation "-" @operator.arithmetic)
[
  "&&"
  "||"
] @operator.logical

[
  "="
  "<-"
] @operator.assignment

[
  "+"
  "-"
  "*"
  "/"
  "%"
] @operator.arithmetic

[
  "=="
  "!="
  ">"
  "<"
  ">="
  "<="
] @operator.comparison

[
  "->"
  ".."
  "<>"
  "|>"
  ":"
] @operator

; Punctuation
[
  "("
  ")"
  "["
  "]"
  "{"
  "}"
  "<<"
  ">>"
] @punctuation.bracket
[
  "."
  ","
  ;; Controversial -- maybe some are operators?
  ":"
  "#"
  "="
  "->"
  ".."
  "-"
  "<-"
] @punctuation.delimiter
