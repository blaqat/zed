;; Methods
(method_declaration name: (identifier) @function.declaration)
(local_function_statement name: (identifier) @function.declaration)

;; Types
(interface_declaration name: (identifier) @type)
(class_declaration name: (identifier) @type)
(enum_declaration name: (identifier) @type)
(struct_declaration (identifier) @type)
(record_declaration (identifier) @type)
(record_struct_declaration (identifier) @type)
(namespace_declaration name: (identifier) @type)

(constructor_declaration name: (identifier) @constructor)
(destructor_declaration name: (identifier) @constructor)

(implicit_type) @type.builtin
(predefined_type) @type.builtin.primitive

(_ type: (identifier) @type)

;; Enum
(enum_member_declaration (identifier) @property)

;; Literals
[
  (real_literal)
  (integer_literal)
] @number

[
  (character_literal)
  (string_literal)
  (verbatim_string_literal)
  (interpolated_string_text)
  (interpolated_verbatim_string_text)
  "\""
  "$\""
  "@$\""
  "$@\""
 ] @string

(boolean_literal) @boolean
(null_literal) @constant.builtin

;; Comments
(comment) @comment

;; Tokens
[
  ";"
  "."
  ","
] @punctuation.delimiter

[
  "&&"
  "||"
  "!"
  "?"
  "??"
  "??="
] @operator.logical

[
  "&"
  "&="
  "|"
  "|="
  "^"
  "^="
  "~"
  "<<"
  "<<="
  ">>"
  ">>="
  ">>>"
  ">>>="
] @operator.bitwise

[
  "="
  "--"
  "++"
  "-="
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
  "<"
  "<="
  "=="
  "!="
  ">"
  ">="
] @operator.comparison

[
  "=>"
  ":"
] @operator

[
  "("
  ")"
  "["
  "]"
  "{"
  "}"
]  @punctuation.bracket

;; Keywords
(modifier) @keyword
(this_expression) @keyword
(escape_sequence) @keyword

[
  "break"
  "case"
  "catch"
  "checked"
  "continue"
  "default"
  "do"
  "else"
  "finally"
  "for"
  "foreach"
  "goto"
  "if"
  "lock"
  "return"
  "switch"
  "throw"
  "try"
  "unchecked"
  "while"
  "await"
  "yield"
  "when"
] @keyword.control

[
  "add"
  "alias"
  "as"
  "base"
  "class"
  "delegate"
  "enum"
  "event"
  "explicit"
  "extern"
  "global"
  "implicit"
  "interface"
  "is"
  "namespace"
  "notnull"
  "operator"
  "params"
  "remove"
  "sizeof"
  "stackalloc"
  "static"
  "struct"
  "typeof"
  "using"
  "new"
  "in"
  "get"
  "set"
  "out"
  "ref"
  "from"
  "where"
  "select"
  "record"
  "init"
  "with"
  "let"
] @keyword

;; Linq
(from_clause (identifier) @variable)
(group_clause (identifier) @variable)
(order_by_clause (identifier) @variable)
(join_clause (identifier) @variable)
(select_clause (identifier) @variable)
(query_continuation (identifier) @variable) @keyword

;; Record
(with_expression
  (with_initializer_expression
    (simple_assignment_expression
      (identifier) @variable)))

;; Exprs
(binary_expression (identifier) @variable (identifier) @variable)
(binary_expression (identifier)* @variable)
(conditional_expression (identifier) @variable)
(prefix_unary_expression (identifier) @variable)
(postfix_unary_expression (identifier)* @variable)
(assignment_expression (identifier) @variable)
(cast_expression (_) (identifier) @variable)

;; Class
(base_list (identifier) @type) ;; applies to record_base too
(property_declaration (generic_name))
(property_declaration
  name: (identifier) @variable)
(property_declaration
  name: (identifier) @variable)
(property_declaration
  name: (identifier) @variable)

;; Lambda
(lambda_expression) @variable

;; Attribute
(attribute) @attribute

;; Parameter
(parameter
  name: (identifier) @variable.parameter)
(parameter (identifier) @variable.parameter)
(parameter_modifier) @keyword

;; Variable declarations
(variable_declarator (identifier) @variable)
(for_each_statement left: (identifier) @variable)
(catch_declaration (_) (identifier) @variable)

;; Return
(return_statement (identifier) @variable)
(yield_statement (identifier) @variable)

;; Type
(generic_name (identifier) @type)
(type_parameter (identifier) @property)
(type_argument_list (identifier) @type)
(as_expression right: (identifier) @type)
(is_expression right: (identifier) @type)

;; Type constraints
(type_parameter_constraints_clause (identifier) @property)

;; Switch
(switch_statement (identifier) @variable)
(switch_expression (identifier) @variable)

;; Lock statement
(lock_statement (identifier) @variable)

;; Builtins
((identifier) @variable.builtin
	(#any-of? @variable.builtin
		"Console" "Math" "File" "Directory" "Environment"))

;; Method calls
(invocation_expression (member_access_expression name: (identifier) @function))
