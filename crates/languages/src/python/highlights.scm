(identifier) @variable
(attribute attribute: (identifier) @property)
(type (identifier) @type)
(keyword_argument
	name: (identifier) @variable.parameter
	value: (identifier) @variable)

; Function calls

(decorator
	"@" @attribute
	(identifier) @attribute)

(decorator
"@"
((identifier) @attribute.builtin
	(#match? @attribute.builtin "^(enum|property|classmethod|staticmethod|functools.wraps|functools.singledispatch|functools.lru_cache|functools.cmp_to_key|functools.total_ordering|functools.partial|typing.overload|contextlib.contextmanager|dataclasses.dataclass|atexit.register|abc.ABCMeta.register|enum.unique|xmlrpc.register_function|sys.settrace|coroutine|throttle|exceptionCatcher|timeit|async_process|threaded|debug|skip_if_env|lock_or_wait|unittest.mock.patch|wrapt.patch_function_wrapper|trycatch|log_calls|decorator|decorator_args|named_decorator|dec.decorator|log_call|intercept|instead|before|undecorated|click.option|config_decorator.setting|regex_decorator.listen|expose|register|contract|pedantic|trace|dirty|Decorator|mutable|final|auto_obj|to_string|data|repeat|DataAttribute|curried|attrs|arg.validate|main|retry|self|inject)$")
))

(call
  function: (attribute attribute: (identifier) @function.method))
(call
  function: (identifier) @function)


; Identifier naming conventions

((identifier) @type
 (#match? @type "^[A-Z]"))

((identifier) @constant
 (#match? @constant "^_*[A-Z][A-Z\\d_]*$"))

; Builtin functions and types
((identifier) @function.builtin
	(#match?
   @function.builtin
   "^(abs|all|any|ascii|bin|breakpoint|bytearray|bytes|callable|chr|classmethod|compile|complex|delattr|dict|dir|divmod|enumerate|eval|exec|filter|float|format|frozenset|getattr|globals|hasattr|hash|help|hex|id|input|int|isinstance|issubclass|iter|len|list|locals|map|max|memoryview|min|next|object|oct|open|ord|pow|print|property|range|repr|reversed|round|set|setattr|slice|sorted|staticmethod|str|sum|super|tuple|type|vars|zip|__import__)$")
	)

((identifier) @type.builtin
	(#match?
   @type.builtin
   "^(list|dict|tuple|set|bytes|bytearray|memoryview|range|frozenset|object)$")
	)

((identifier) @type.builtin.primative
	(#match?
   @type.builtin.primative
   "^(int|float|str|bool|complex)$")
	)

((call
  function: (identifier) @function.builtin)
 (#match?
   @function.builtin
   "^(abs|all|any|ascii|bin|bool|breakpoint|bytearray|bytes|callable|chr|classmethod|compile|complex|delattr|dict|dir|divmod|enumerate|eval|exec|filter|float|format|frozenset|getattr|globals|hasattr|hash|help|hex|id|input|int|isinstance|issubclass|iter|len|list|locals|map|max|memoryview|min|next|object|oct|open|ord|pow|print|property|range|repr|reversed|round|set|setattr|slice|sorted|staticmethod|str|sum|super|tuple|type|vars|zip|__import__)$")
 )

; Function definitions

(function_definition
  name: (identifier) @function.declaration)

; Literals
[
  (none)
] @constant.builtin

[
	(true)
  (false)
] @boolean

[
  (integer)
  (float)
] @number

; Self references

[
  (parameters (identifier) @variable.parameter)
  (typed_parameter (identifier) @variable.parameter)
  (attribute (identifier) @variable.special)
  (#match? @variable.special "^self$")
]

(comment) @comment
(string) @string
(escape_sequence) @escape

[
  "("
  ")"
  "["
  "]"
  "{"
  "}"
] @punctuation.bracket

(interpolation
  "{" @punctuation.special
  "}" @punctuation.special) @embedded

[
	"->"
	","
	":"
] @punctuation.delimiter

; Docstrings.
(function_definition
  "async"?
  "def"
  name: (_)
  (parameters)?
  body: (block
    (expression_statement (string
    	((string_start) @comment.doc.
    	(string_content) @comment.doc
    	(string_end) @comment.doc.
     (#eq? @comment.doc. "\"\"\""))
    ))
  )
)

(class_definition
  body: (block
    (expression_statement (string
    	(string_start) @comment.doc.
    	(string_content) @comment.doc
    	(string_end) @comment.doc.
     (#eq? @comment.doc. "\"\"\"")))))

[
  "-"
  "*"
  "**"
  "/"
  "//"
  "%"
  "^"
  "+"
] @operator.arithmetic

[
	"not"
	"and"
	"or"
] @operator.logical

[
	"="
	"-="
  "//="
  "/="
	"**="
  "*="
	"%="
	"+="
	":="
] @operator.assignment

[
	"^"
	"|"
	"&"
	"<<"
	">>"
	"~"
] @operator.bitwise

[
	"is"
	"is not"
	"=="
	"!="
	"!="
	"<"
	">"
	"<="
	">="
	"<>"
] @operator.comparison

[
  "global" "nonlocal"
] @keyword.modifier

[
  "class"
] @keyword.typedef

[
  "def" "lambda"
] @keyword.function

[
  "import" "from" "as"
] @keyword.import

[
  "return" "yield" "break" "continue" "pass"
] @keyword.return

[
  "if" "elif" "else" "match" "case"
] @keyword.conditional

[
  "for" "while"
] @keyword.repeat

[
  "try" "except" "finally" "raise"
] @keyword.exception

[
  "assert"
] @keyword.debug

[
  "async" "await"
] @keyword.coroutine

[
  "in" "not in"
] @keyword.op

[
  "del" "exec" "print" "with"
] @keyword
