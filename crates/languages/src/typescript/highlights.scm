
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
((predefined_type) @type.builtin.primitive
	(#match?
	 @type.builtin.primitive
	 "^(boolean|number|string|object|symbol|any)$"))


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
  (template_literal_type)
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
  "?"
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
  "as"
  "await"
  "class"
  "const"
  "delete"
  "export"
  "extends"
  "from"
  "function"
  "get"
  "import"
  "in"
  "instanceof"
  "let"
  "new"
  "of"
  "set"
  "static"
  "target"
  "typeof"
  "var"
  "void"
  "yield"
] @keyword

[
	"async"
  "break"
  "case"
  "catch"
  "continue"
  "debugger"
  "default"
  "do"
  "else"
  "finally"
  "for"
  "if"
  "return"
  "satisfies"
  "switch"
  "throw"
  "try"
  "while"
  "with"
] @keyword.control

[ "abstract"
  "declare"
  "enum"
  "export"
  "implements"
  "interface"
  "keyof"
  "namespace"
  "private"
  "protected"
  "public"
  "type"
  "readonly"
  "override"
  ((identifier) @keyword
	(#match?
     @keyword
     "^(global|module)$"))
] @keyword
