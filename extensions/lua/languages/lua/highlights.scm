;; Keywords

"return" @keyword

[
	"goto"
] @keyword.control

[
 "in"
 "local"
] @keyword

(break_statement) @keyword.control

(do_statement
[
  "do"
  "end"
] @keyword)

(while_statement
[
  "while"
  "do"
  "end"
] @keyword.control)

(repeat_statement
[
  "repeat"
  "until"
] @keyword.control)

(if_statement
[
  "if"
  "elseif"
  "else"
  "then"
  "end"
] @keyword.control)

(elseif_statement
[
  "elseif"
  "then"
  "end"
] @keyword.control)

(else_statement
[
  "else"
  "end"
] @keyword.control)

(for_statement
[
  "for"
  "do"
  "end"
] @keyword.control)

(function_declaration
[
  "function"
  "end"
] @keyword)

(function_definition
[
  "function"
  "end"
] @keyword)

;; Operators

[
 "and"
 "not"
 "or"
] @operator.logical

[
  "+"
  "-"
  "*"
  "/"
  "%"
  "//"
  "^"
] @operator.arithmetic

[
  "=="
  "~="
  "<="
  ">="
  "<"
  ">"
] @operator.comparison

[
  "="
] @operator.assignment

[
  "&"
  "~"
  "|"
  "<<"
  ">>"
] @operator.bitwise

[
  "#"
  ".."
] @operator

;; Punctuations

[
  ";"
  ":"
  ","
  "."
] @punctuation.delimiter

;; Brackets

[
 "("
 ")"
 "["
 "]"
 "{"
 "}"
] @punctuation.bracket

;; Variables

(identifier) @variable

((identifier) @variable.special
 (#eq? @variable.special "self"))

(variable_list
   attribute: (attribute
     (["<" ">"] @punctuation.bracket
      (identifier) @attribute)))

;; Constants

((identifier) @constant
 (#match? @constant "^[A-Z][A-Z_0-9]*$"))

(vararg_expression) @constant

(nil) @constant.builtin

[
  (false)
  (true)
] @boolean

;; Tables

(field name: (identifier) @property)

(dot_index_expression field: (identifier) @property)

(table_constructor
[
  "{"
  "}"
] @constructor)

;; Functions

(parameters (identifier) @variable.parameter)

(function_call
  name: [
    (identifier) @function
    (dot_index_expression field: (identifier) @function)
  ])

(function_declaration
  name: [
    (identifier) @function.declaration
    (_
    	field: (identifier) @function.declaration
   		method: (identifier) @function.declaration)
  ])

(function_declaration
	name: (_ table: (identifier))
	(parameters
		((identifier) @variable.special
		 (#eq? @variable.special "self")))
	)

(method_index_expression method: (identifier) @function.method)

(function_call
  (identifier) @function.builtin
  (#any-of? @function.builtin
    ;; built-in functions in Lua 5.1
    "assert" "collectgarbage" "dofile" "error" "getfenv" "getmetatable" "ipairs"
    "load" "loadfile" "loadstring" "module" "next" "pairs" "pcall" "print"
    "rawequal" "rawget" "rawset" "require" "select" "setfenv" "setmetatable"
    "tonumber" "tostring" "type" "unpack" "xpcall"))

;; Others

(comment) @comment

(hash_bang_line) @preproc

(number) @number

(string) @string
