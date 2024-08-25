
(php_tag) @tag
"?>" @tag

; Types

(primitive_type) @type.builtin.primitive
(cast_type) @type.builtin
(named_type (name) @type) @type
(named_type (qualified_name) @type) @type

; Functions

(array_creation_expression "array" @function.builtin)
(list_literal "list" @function.builtin)

(method_declaration
  name: (name) @function.method)

(function_call_expression
  function: [(qualified_name (name)) (name)] @function)

(scoped_call_expression
  name: (name) @function)

(member_call_expression
  name: (name) @function.method)

(function_definition
  name: (name) @function)

; Member

(property_element
  (variable_name) @property)

(member_access_expression
  name: (variable_name (name)) @property)
(member_access_expression
  name: (name) @property)

; Variables

(relative_scope) @variable.builtin

((name) @constant
 (#match? @constant "^_?[A-Z][A-Z\\d_]+$"))
((name) @constant.builtin
 (#match? @constant.builtin "^__[A-Z][A-Z\d_]+__$"))

((name) @constructor
 (#match? @constructor "^[A-Z]"))

((name) @variable.special
 (#eq? @variable.special "this"))

(variable_name) @variable
(simple_parameter (variable_name) @variable.parameter)

; Basic tokens
[
  (string)
  (string_value)
  (encapsed_string)
  (heredoc)
  (heredoc_body)
  (nowdoc_body)
] @string
(boolean) @boolean
(null) @constant.builtin
(integer) @number
(float) @number
(comment) @comment

; Operators
[
  "&&" "||" "!" "and" "or" "xor"
] @operator.logical

[
  "&" "|" "^" "~" "<<" ">>"
] @operator.bitwise

[
  "=" "+=" "-=" "*=" "/=" "%=" "**=" ".=" "++" "--"
] @operator.assignment

[
  "+" "-" "*" "/" "%" "**"
] @operator.arithmetic

[
  "==" "!=" "===" "!==" ">" "<" ">=" "<=" "<=>"
] @operator.comparison

[
  "$" "instanceof" "@" "->" "=>" "??" "?" ":" "..."  ":"
] @operator

; Punctuation
[
	"{" "}" "(" ")" "[" "]"
] @punctuation.bracket

[
	"," ";"
] @punctuation.delimiter

[
	"." "::"
] @punctuation

; Keywords

[
  "abstract"
  "as"
  "class"
  "clone"
  "const"
  "declare"
  "echo"
  "enum"
  "extends"
  "final"
  "function"
  "fn"
  "global"
  "implements"
  "include"
  "include_once"
  "insteadof"
  "interface"
  "match"
  "namespace"
  "new"
  "private"
  "protected"
  "public"
  "readonly"
  "require"
  "require_once"
  "static"
  "trait"
  "use"
  "yield"
  ; "yield from" (Crashes Extension)
] @keyword

[
  "break"
  "case"
  "catch"
  "continue"
  "default"
  "do"
  "else"
  "elseif"
  "enddeclare"
  "endforeach"
  "endif"
  "endswitch"
  "endwhile"
  "finally"
  "for"
  "foreach"
  "if"
  "return"
  "switch"
  "throw"
  "try"
  "while"
] @keyword.control
