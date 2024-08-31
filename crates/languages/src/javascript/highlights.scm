; Variables

(identifier) @variable
(required_parameter (identifier) @variable.parameter)

; Properties

(property_identifier) @property
(shorthand_property_identifier) @property
(shorthand_property_identifier_pattern) @property

; Function and method calls

(call_expression
  function: (identifier) @function)

(call_expression
  function: (member_expression
    property: (property_identifier) @function.method))

((identifier) @function.builtin
	(#match?
	 @function.builtin
	 "^(eval|require|exports|process|setTimeout|clearTimeout|setInterval|clearInterval|setImmediate|clearImmediate|alert|confirm|prompt|open|close)$"))

; Function and method definitions

(function_expression
  name: (identifier) @function)
(function_declaration
  name: (identifier) @function.declaration)
(method_definition
  name: (property_identifier) @function.method)

(pair
  key: (property_identifier) @function.method
  value: [(function_expression) (arrow_function)])

(assignment_expression
  left: (member_expression
    property: (property_identifier) @function.method)
  right: [(function_expression) (arrow_function)])

(variable_declarator
  name: (identifier) @function
  value: [(function_expression) (arrow_function)])

(assignment_expression
  left: (identifier) @function
  right: [(function_expression) (arrow_function)])

; Special identifiers

((identifier) @type
 (#match? @type "^[A-Z]"))
(type_identifier) @type
(predefined_type) @type.builtin

((identifier) @variable.special
		(#match? @variable.special "^(NaN|Infinity)$"))

(lexical_declaration
	kind: "const"
	(variable_declarator
	  name: (identifier) @constant))

; Builtin Namespaces

((identifier) @variable.builtin
	(#match?
   @variable.builtin
   "^(console|window|document|arguments|process)$"))

([
  (identifier)
  (shorthand_property_identifier)
  (shorthand_property_identifier_pattern)
 ] @constant
 (#match? @constant "^_*[A-Z_][A-Z\\d_]*$"))

; Literals

(this) @variable.special
(super) @variable.special

[
  (null)
  (undefined)
] @constant.builtin

[
  (true)
  (false)
] @boolean

(comment) @comment

[
  (string)
  (template_string)
] @string

(escape_sequence) @string.escape

(regex) @string.regex
(number) @number

; Tokens

[
  ";"
  "?."
  "."
  ","
  ":"
] @punctuation.delimiter

[
  "=>"
] @operator

[
	"/"
  "%"
	"-"
  "+"
  "*"
  "**"
] @operator.arithmetic

[
  "="
  "--"
  "-="
  "+="
  "*="
  "**="
  "/="
  "%="
  "<<="
  ">>="
  ">>>="
  "^="
  "&="
  "|="
  "&&="
  "||="
  "??="
] @operator.assignment

[
  "<"
  "<="
  "=="
  "==="
  ">"
  ">="
  "!="
  "!=="
] @operator.comparison

[
  "<<"
  ">>"
  ">>>"
  "~"
  "^"
  "&"
  "|"
] @operator.bitwise

[
  "&&"
  "||"
  "??"
  "!"
] @operator.logical

[
  "("
  ")"
  "["
  "]"
  "{"
  "}"
]  @punctuation.bracket
(template_substitution
  "${" @punctuation.special
  "}" @punctuation.special) @embedded

(type_arguments
  "<" @punctuation.bracket
  ">" @punctuation.bracket)

; Keywords
[
  "const" "let" "var" "static" "async" "await"
] @keyword.modifier

[
  "class" "extends" "instanceof" "typeof" "in"
] @keyword.typedef

[
  "function"
] @keyword.function

[
  "import" "export" "from"
] @keyword.import

[
  "break" "continue" "return" "yield"
] @keyword.return

[
  "if" "else" "switch" "case" "default"
] @keyword.conditional

[
  "for" "while" "do"
] @keyword.repeat

[
  "try" "catch" "finally" "throw"
] @keyword.exception

[
  "debugger"
] @keyword.debug

[
  "delete" "void" "with" "of" "new" "get" "set" "target"
  "abstract" "declare" "enum" "implements" "interface" "keyof" "namespace"
  "private" "protected" "public" "readonly" "override" "type"
  ((identifier) @keyword (#match? @keyword "^(global|module)$"))
] @keyword

; JSX elements

(jsx_opening_element (identifier) @tag (#match? @tag "^[a-z][^.]*$"))
(jsx_closing_element (identifier) @tag (#match? @tag "^[a-z][^.]*$"))
(jsx_self_closing_element (identifier) @tag (#match? @tag "^[a-z][^.]*$"))

(jsx_attribute (property_identifier) @attribute)
(jsx_opening_element (["<" ">"]) @punctuation.bracket.tag)
(jsx_closing_element (["</" ">"]) @punctuation.bracket.tag)
(jsx_self_closing_element (["<" "/>"]) @punctuation.bracket.tag)
