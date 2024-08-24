(identifier) @variable
; Keywords

[
  "begin"
  "break"
  "case"
  "do"
  "else"
  "elsif"
  "end"
  "ensure"
  "for"
  "if"
  "in"
  "next"
  "rescue"
  "retry"
  "return"
  "then"
  "unless"
  "until"
  "when"
  "while"
  "yield"
] @keyword.control

[
  "alias"
  "class"
  "def"
  "module"
] @keyword


((identifier) @keyword
 (#match? @keyword "^(private|protected|public)$"))

; Function calls
"defined?" @function.builtin

(call
  method: [(identifier) (constant)] @function.method)

; Function definitions

(alias (identifier) @function.method)
(setter (identifier) @function.method)
(method name: [(identifier) (constant)] @function.declaration)
(singleton_method name: [(identifier) (constant)] @function.declaration)
(method_parameters [
  (identifier) @variable.parameter
  (optional_parameter name: (identifier) @variable.parameter)
  (keyword_parameter [name: (identifier) (":")] @variable.parameter)
  ])

(block_parameters (identifier) @variable.parameter)

; Identifiers

((identifier) @constant.builtin
 (#match? @constant.builtin "^__(FILE|LINE|ENCODING)__$"))

((identifier) @function.builtin
  (#any-of?
   @function.builtin
   "puts" "print" "p" "gets" "chomp" "require" "load" "exit" "sleep" "rand" "srand" "proc"))

(file) @constant.builtin
(line) @constant.builtin
(encoding) @constant.builtin

(hash_splat_nil
  "**" @operator
) @constant.builtin

(global_variable) @constant

(constant) @type

((constant) @constant
 (#match? @constant "^[A-Z\\d_]+$"))

(superclass
  (constant) @variable.special)

(superclass
  (scope_resolution
    (constant) @variable.special))

(superclass
  (scope_resolution
    (scope_resolution
      (constant) @variable.special)))

(self) @variable.special
(super) @variable.special

((constant) @type.builtin
  (#any-of?
   @type.builtin
   "Array"
   "Hash"
   "Regexp"
   "Range"
   "Time"
   "Struct"
   "Module"
   "Class"))

((constant) @type.builtin.primitive
  (#any-of?
   @type.builtin.primitive
   "Integer"
   "Float"
   "String"
   "Symbol"
   "TrueClass"
   "FalseClass"
   "NilClass"))

[
  (class_variable)
  (instance_variable)
] @property


; Literals

[
  (string)
  (bare_string)
  (subshell)
  (heredoc_body)
  (heredoc_beginning)
] @string

[
  (simple_symbol)
  (delimited_symbol)
  (hash_key_symbol)
  (bare_symbol)
] @string.special.symbol

(regex) @string.regex
(escape_sequence) @string.escape

[
  (integer)
  (float)
] @number

[
  (true)
  (false)
] @boolean

(nil) @constant.builtin

(comment) @comment

; Operators

[
  "!"
  "||"
  "&&"
  "and"
  "or"
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
  "**="
  "*="
  "/="
  "%="
  "+="
  "-="
  "<<="
  ">>="
  "&&="
  "&="
  "||="
  "|="
  "^="
] @operator.assignment

[
  "+"
  "-"
  "**"
  "*"
  "/"
  "%"
] @operator.arithmetic

[
  ">"
  "<"
  "<="
  ">="
  "=="
  "!="
  "=~"
  "!~"
  "<=>"
] @operator.comparison

[
  ".."
  "..."
  "=>"
  "->"
  (operator)
] @operator

[
  ","
  ";"
  "."
  "::"
] @punctuation.delimiter

[
  "("
  ")"
  "["
  "]"
  "{"
  "}"
  "%w("
  "%i("
] @punctuation.bracket

(interpolation
  "#{" @punctuation.special
  "}" @punctuation.special) @embedded
