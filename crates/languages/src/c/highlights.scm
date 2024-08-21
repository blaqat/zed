[
  "const"
  "enum"
  "extern"
  "inline"
  "sizeof"
  "static"
  "struct"
  "typedef"
  "union"
  "volatile"
] @keyword

[
  "break"
  "case"
  "continue"
  "default"
  "do"
  "else"
  "for"
  "if"
  "return"
  "switch"
  "while"
] @keyword.control

[
  "#define"
  "#elif"
  "#else"
  "#endif"
  "#if"
  "#ifdef"
  "#ifndef"
  "#include"
  (preproc_directive)
] @keyword.special

[
  "&&"
  "!"
  "||"
] @operator.logical

[
  "&"
  "|"
  "^"
  "~"
  ">>"
  "<<"
] @operator.bitwise

[
  "="
  "--"
  "++"
  "+="
  "-="
  "*="
  "/="
  "%="
  "&="
  "|="
  "^="
  "<<="
  ">>="
] @operator.assignment

[
  "+"
  "-"
  "*"
  "/"
  "%"
] @operator.arithmetic

[
  "=="
  "!="
  "<"
  ">"
  "<="
  ">="
] @operator.comparison

[
  "->"
] @operator

[
  "."
  ";"
] @punctuation.delimiter

[
  "{"
  "}"
  "("
  ")"
  "["
  "]"
] @punctuation.bracket

[
  (string_literal)
  (system_lib_string)
  (char_literal)
] @string

(escape_sequence) @string.escape

(comment) @comment

(number_literal) @number

[
  (null)
] @constant.builtin

[
	(true)
  (false)
] @boolean

(identifier) @variable
(parameter_declaration (identifier) @variable.parameter)
(parameter_declaration (_ (identifier) @variable.parameter))

((identifier) @constant
 (#match? @constant "^_*[A-Z][A-Z\\d_]*$"))
(declaration
	(type_qualifier "const")
	[
		(init_declarator (identifier) @constant)
		(init_declarator (_ (identifier) @constant))
	]
	)

(preproc_def (identifier) @constant)

(call_expression
  function: (identifier) @function)
(call_expression
  function: (field_expression
    field: (field_identifier) @function))
(function_declarator
  declarator: (identifier) @function.declaration)
(preproc_function_def
  name: (identifier) @function.special)

((identifier) @function.builtin
	(#match? @function.builtin "^(printf|scanf|sprintf|snprintf|fprintf|fscanf|sscanf|vprintf|vfprintf|vsprintf|vsnprintf|vscanf|vfscanf|vsscanf|puts|getchar|putchar|gets|fgets|fputs|fgetc|fputc|fread|fwrite|fopen|fclose|fseek|ftell|rewind|ferror|clearerr|malloc|calloc|realloc|free|memcpy|memmove|memset|memcmp|strcpy|strncpy|strcat|strncat|strlen|strcmp|strncmp|strchr|strrchr|strstr|strtok|atoi|atof|atol|abs|fabs|ceil|floor|sqrt|pow|sin|cos|tan|asin|acos|atan|exp|log|log10|time|clock|rand|srand|exit|abort|atexit|system|qsort|bsearch)$"))

(field_identifier) @property
(statement_identifier) @label

[
  (type_identifier)
] @type

[
	(primitive_type)
	(sized_type_specifier)
] @type.builtin

((primitive_type) @type.builtin.primitive
	(#match? @type.builtin.primitive "^(void|char|short|int|long|float|double)$"))
