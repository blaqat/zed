
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
  "abstract" "final" "private" "protected" "public" "readonly" "static" "global"
] @keyword.modifier

[
  "class" "trait" "enum" "interface" "implements" "extends" "namespace"
] @keyword.typedef

[
  "function" "fn"
] @keyword.function

[
  "use" "namespace" "include" "include_once" "require" "require_once"
] @keyword.import

[
  "return" "yield" "break" "continue"
] @keyword.return

[
  "if" "else" "elseif" "switch" "case" "default" "match"
] @keyword.conditional

[
  "for" "foreach" "while" "do"
] @keyword.repeat

[
  "try" "catch" "finally" "throw"
] @keyword.exception

[
  "clone" "new" "insteadof" "instanceof"
] @keyword.operator

[
  "declare" "echo" "enddeclare" "endforeach" "endif" "endswitch" "endwhile"
  "as" "const"
] @keyword
