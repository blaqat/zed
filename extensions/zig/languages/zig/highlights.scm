[
  (container_doc_comment)
  (doc_comment)

] @comment.doc

[
    (line_comment)
] @comment

[
  variable: (IDENTIFIER)
  variable_type_function: (IDENTIFIER)
] @variable

;; func parameter
parameter: (IDENTIFIER) @variable.parameter

[
  field_member: (IDENTIFIER)
  field_access: (IDENTIFIER)
] @property

;; assume TitleCase is a type
(
  [
    variable_type_function: (IDENTIFIER)
    field_access: (IDENTIFIER)
    parameter: (IDENTIFIER)
  ] @type
  (#match? @type "^[A-Z]([a-z]+[A-Za-z0-9]*)+$")
)

;; assume camelCase is a function
(
  [
    variable_type_function: (IDENTIFIER)
    field_access: (IDENTIFIER)
    parameter: (IDENTIFIER)
  ] @function
  (#match? @function "^[a-z]+([A-Z][a-z0-9]*)+$")
)

;; assume all CAPS_1 is a constant
(
  [
    variable_type_function: (IDENTIFIER)
    field_access: (IDENTIFIER)
  ] @constant
  (#match? @constant "^[A-Z][A-Z_0-9]+$")
)

(VarDecl
	"const"
	variable_type_function: (IDENTIFIER) @constant)

function_call: (IDENTIFIER) @function
function: (IDENTIFIER) @function.declaration

exception: "!" @keyword

(
  (IDENTIFIER) @variable.special
  (#eq? @variable.special "_")
)

(PtrTypeStart "c" @variable.special)

(
  (ContainerDeclType
    [
      (ErrorUnionExpr)
      "enum"
    ]
  )
  (ContainerField (IDENTIFIER) @constant)
)

field_constant: (IDENTIFIER) @constant

(BUILTINIDENTIFIER) @keyword

((BUILTINIDENTIFIER) @function
  (#any-of? @function "@import" "@cImport"))

(INTEGER) @number

(FLOAT) @number

[
  "true"
  "false"
] @boolean

[
  (LINESTRING)
  (STRINGLITERALSINGLE)
] @string

(CHAR_LITERAL) @string.special.symbol
(EscapeSequence) @string.escape
(FormatSequence) @string.special

(BreakLabel (IDENTIFIER) @tag)
(BlockLabel (IDENTIFIER) @tag)

[
  "and"
  "or"
  "orelse"
] @operator.logical

[
  "const" "var" "volatile" "allowzero" "noalias" "align" "linksection"
  "threadlocal" "pub" "export" "extern" "inline" "noinline" "comptime"
] @keyword.modifier

[
  "struct" "union" "enum" "error"
] @keyword.typedef

[
  "fn"
] @keyword.function

[
  "return" "break" "continue"
] @keyword.return

[
  "if" "else" "switch"
] @keyword.conditional

[
  "for" "while"
] @keyword.repeat

[
  "try" "catch" "errdefer"
] @keyword.exception

[
  "async" "await" "suspend" "nosuspend" "resume"
] @keyword.coroutine

[
  "asm" "defer" "test" "opaque" "usingnamespace" "addrspace" "callconv" "packed"
] @keyword

[
  "anytype"
  "anyframe"
] @type.builtin

(BuildinTypeExpr) @type.builtin.primitive
; ((BuildinTypeExpr) @type.builtin.primitive
; 	(#any-of? @type.builtin.primitive "bool" "i8" "i16" "i32" "i64" "u8" "u16" "u32" "u64" "f32" "f64" "c64" "c128" "void" "noreturn" "type" "comptime_int" "comptime_float" "comptime_str" "comptime_bool" "isize" "usize" "type"))

[
  "const"
  "var"
  "volatile"
  "allowzero"
  "noalias"
  "addrspace"
  "align"
  "callconv"
  "linksection"
] @keyword.special

[
  "comptime"
  "export"
  "extern"
  "inline"
  "noinline"
  "packed"
  "pub"
  "threadlocal"
  "async"
  "await"
  "suspend"
  "nosuspend"
  "resume"
  "and"
  "or"
  "orelse"
  "return"
  "if"
  "else"
  "switch"
] @keyword

[
  "usingnamespace"
] @constant

[
  "anytype"
  "anyframe"
  (BuildinTypeExpr)
] @type

[
  "null"
  "unreachable"
  "undefined"
] @constant.builtin

[
  (CompareOp)
  (BitwiseOp)
  (BitShiftOp)
  (AdditionOp)
  (AssignOp)
  (MultiplyOp)
  (PrefixOp)
  "*"
  "**"
  "->"
  ".?"
  ".*"
  "?"
] @operator

[
  ";"
  "."
  ","
  ":"
] @punctuation.delimiter

[
  ".."
  "..."
] @punctuation.special

[
  "["
  "]"
  "("
  ")"
  "{"
  "}"
  (Payload "|")
  (PtrPayload "|")
  (PtrIndexPayload "|")
] @punctuation.bracket

; Error
(ERROR) @error
