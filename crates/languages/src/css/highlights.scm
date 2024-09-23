(comment) @comment

[
  (tag_name)
  (nesting_selector)
  (universal_selector)
] @tag

[
  "~"
  ">"
  "only"
] @operator

[
  "+"
  "-"
  "*"
  "/"
] @operator.arithmetic

[
  "="
  "^="
  "|="
  "~="
  "$="
  "*="
] @operator.assignment

[
  "and"
  "or"
  "not"
] @operator.logical

(attribute_selector (plain_value) @string)

(attribute_name) @attribute
(pseudo_element_selector (tag_name) @attribute)
(pseudo_class_selector (class_name) @attribute)

[
  (class_name)
  (id_name)
  (namespace_name)
  (feature_name)
] @property

(property_name) @property

(function_name) @function

(function_name) @function.builtin
(#any-of? @function.builtin
  "var" "rgb"  "rgba"  "hsl"  "hsla"  "calc" "clamp" "min"
  "max" "url" "attr" "env" "counter" "counters" "repeat" "matrix" "matrix3d"
  "translate" "translate3d" "translateX" "translateY" "translateZ" "scale" "scale3d" "scaleX" "scaleY" "scaleZ"
  "rotate" "rotate3d" "rotateX" "rotateY" "rotateZ" "skew" "skewX" "skewY" "perspective"
  "cubic-bezier" "steps" "linear-gradient" "radial-gradient" "conic-gradient" "repeating-linear-gradient" "repeating-radial-gradient" "repeating-conic-gradient" )

(
  [
    (property_name)
    (plain_value)
  ] @variable.special
  (#match? @variable.special "^--")
)

[
  "@media"
  "@import"
  "@charset"
  "@namespace"
  "@supports"
  "@keyframes"
  (at_keyword)
  (to)
  (from)
  (important)
]  @keyword

(string_value) @string
(color_value) @string.special

[
  (integer_value)
  (float_value)
] @number

(unit) @type

[
  ","
  ":"
  "."
  "::"
  ";"
  "#"
] @punctuation.delimiter

[
  "{"
  ")"
  "("
  "}"
  "["
  "]"
] @punctuation.bracket
