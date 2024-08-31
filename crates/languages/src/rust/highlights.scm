
(identifier) @variable
(type_identifier) @type
(primitive_type) @type.builtin.primitive
(self) @variable.special
(field_identifier) @property

(parameter
	pattern: (identifier) @variable.parameter)

(trait_item name: (type_identifier) @type.interface)
(impl_item trait: (type_identifier) @type.interface)
(abstract_type trait: (type_identifier) @type.interface)
(dynamic_type trait: (type_identifier) @type.interface)
(trait_bounds (type_identifier) @type.interface)

(call_expression
  function: [
    (identifier) @function
    (scoped_identifier
      name: (identifier) @function)
    (field_expression
      field: (field_identifier) @function.method)
  ])

(generic_function
  function: [
    (identifier) @function
    (scoped_identifier
      name: (identifier) @function)
    (field_expression
      field: (field_identifier) @function.method)
  ])


(function_item name: (identifier) @function.declaration)
(function_signature_item name: (identifier) @function.declaration)

(macro_invocation
  macro: [
    (identifier) @function.special
    (scoped_identifier
      name: (identifier) @function.special)
  ]
  "!" @function
)

(macro_definition
  name: (identifier) @function.special.definition)

(_
	[
	function: (identifier) @function.builtin
	macro: (identifier) @function.builtin
	]
	(#match?
	 @function.builtin
	 "^(println|print|eprintln|eprint|format|panic|assert|assert_eq|assert_ne|dbg|todo|unimplemented|try|matches|include|include_str|include_bytes|concat|env|option_env|cfg|cfg_attr|compile_error|line|column|file|module_path|stringify|vec|format_args|write|writeln|unreachable)$")
	"!" @function.builtin.
)

; Identifier conventions

; Assume uppercase names are types/enum-constructors
((identifier) @type
 (#match? @type "^[A-Z]"))

; Assume all-caps names are constants
((identifier) @constant
 (#match? @constant "^_*[A-Z][A-Z\\d_]*$"))
(const_item
	name: (identifier) @constant)

; Builtin Types and Constants

((identifier) @type.builtin
	(#match?
	 @type.builtin
	"^(String|Result|Option|Box|Vec|HashMap|HashSet|BTreeMap|BTreeSet|Rc|Arc|Cell|RefCell|Mutex|RwLock|Cow|Path|PathBuf|OsString|OsStr|IpAddr|SocketAddr|Ipv4Addr|Ipv6Addr|Duration|Instant|SystemTime|Pin|Poll|Future|Stream|Pin|Task|Waker|RawWaker|RawWakerVTable)$") )

((identifier) @type.builtin
	(#match?
	 @type.builtin
	 "^(None|Some|Ok|Err)$"))

[
  "("
  ")"
  "{"
  "}"
  "["
  "]"
] @punctuation.bracket

(_
  .
  "<" @punctuation.bracket
  ">" @punctuation.bracket)

[
  ";"
  ","
  "::"
  "."
] @punctuation.delimiter

[
  "#"
] @punctuation.special

[
  "as"
  "const"
  "default"
  "dyn"
  "enum"
  "extern"
  "fn"
  "impl"
  "in"
  "let"
  "macro_rules!"
  "mod"
  "move"
  "pub"
  "ref"
  "static"
  "struct"
  "trait"
  "type"
  "union"
  "use"
  "where"
  (crate)
  (mutable_specifier)
  (super)
] @keyword

[
  "await"
  "break"
  "continue"
  "else"
  "for"
  "if"
  "loop"
  "match"
  "return"
  "unsafe"
  "while"
  "yield"
] @keyword.control

[
  (string_literal)
  (raw_string_literal)
  (char_literal)
] @string

[
  (integer_literal)
  (float_literal)
] @number

(boolean_literal) @boolean

[
  (line_comment)
  (block_comment)
] @comment

[
  (line_comment (doc_comment))
  (block_comment (doc_comment))
] @comment.doc

[
  "->"
  ".."
  "..="
  "..."
  ":"
  "@"
] @operator

[
	"%"
	"*"
	"+"
	"-"
	"/"
] @operator.arithmetic

[
  "&&"
  "||"
  "?"
] @operator.logical
(unary_expression ("!") @operator.logical)

[
  "&"
  "&="
  "|"
  "|="
  "^"
  "^="
  "<<"
  "<<="
  ">>"
  ">>="
] @operator.bitwise

[
  "%="
  "*="
  "+="
  "-="
  "/="
  "="
] @operator.assignment

[
  "!="
  "<"
  "<="
  "=="
  "=>"
  ">"
  ">="
] @operator.comparison

(lifetime) @lifetime

(inner_attribute_item
	"#" @attribute
	"!" @attribute
	(attribute
		(identifier) @attribute))

(attribute_item
	"#" @attribute
	(attribute
		(identifier) @attribute))
    
(parameter (identifier) @variable.parameter)

(attribute_item) @attribute
(inner_attribute_item) @attribute
