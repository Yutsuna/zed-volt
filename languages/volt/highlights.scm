; Identifiers
;------------------------------------------------------------------------------

(identifier) @variable

; Types
;------------------------------------------------------------------------------

(type_identifier) @type

(class_definition
  name: (type_identifier) @type)

(struct_definition
  name: (type_identifier) @type)

(module_definition
  name: (type_identifier) @type)

(mixin_definition
  name: (type_identifier) @type)

(component_definition
  name: (type_identifier) @type)

; Keywords
;------------------------------------------------------------------------------

[
  "abstract"
  "and"
  "case"
  "circuit"
  "class"
  "component"
  "def"
  "do"
  "else"
  "elsif"
  "end"
  "for"
  "getter"
  "if"
  "in"
  "include"
  "macro"
  "mixin"
  "module"
  "not"
  "of"
  "or"
  "property"
  "raise"
  "return"
  "setter"
  "sizeof"
  "struct"
  "then"
  "typeof"
  "unless"
  "when"
  "while"
  "yield"
] @keyword

((identifier) @keyword
 (#match? @keyword "^(private|protected|public)$"))

(visibility_modifier) @keyword

; Function calls & definitions
;------------------------------------------------------------------------------

(call_expression
  (member_expression
    (identifier) @function.method))

(call_expression
  (identifier) @function)

(method_definition
  name: (identifier) @function)

(method_definition
  name: (operator_identifier) @function)

(abstract_method_definition
  name: (identifier) @function)

(abstract_method_definition
  name: (operator_identifier) @function)

(macro_definition
  name: (identifier) @function)

; JSX Elements
;------------------------------------------------------------------------------

(jsx_attribute_name) @attribute

; Variables & Instance variables
;------------------------------------------------------------------------------

(instance_variable) @variable.builtin

(self_expression) @variable.builtin

(parameter
  name: (identifier) @variable.parameter)

(parameter
  name: (instance_variable) @variable.parameter)

; Member declarations
;------------------------------------------------------------------------------

(member_declaration
  name: (identifier) @property)

; Literals
;------------------------------------------------------------------------------

[
  (string)
] @string

(string_content) @string

(symbol_literal) @string.special.symbol

(character_literal) @string.special

(regex) @string.special.regex

(escape_sequence) @escape

(number) @number

[
  (nil_literal)
  (boolean_literal)
] @constant.builtin

(interpolation
  "#{" @punctuation.special
  "}" @punctuation.special) @embedded

(macro_interpolation
  "{{" @punctuation.special
  "}}" @punctuation.special) @embedded

(macro_statement
  "{%" @punctuation.special
  "%}" @punctuation.special) @keyword.directive

(comment) @comment
(doc_comment) @comment

; Annotations
;------------------------------------------------------------------------------

(annotation
  "@[" @punctuation.special
  "]" @punctuation.special) @attribute

; Operators
;------------------------------------------------------------------------------

[
  "+"
  "-"
  "*"
  "/"
  "%"
  "**"
  "//"
  "=="
  "!="
  "<"
  ">"
  "<="
  ">="
  "&&"
  "||"
  "!"
  "<=>"
  "=>"
  "<<"
  ">>"
  "&"
  "|"
  "^"
  "~"
  "->"
  ".."
  "..."
] @operator

(assignment_operator) @operator

; Punctuation
;------------------------------------------------------------------------------

[
  ","
  ";"
  "."
  ":"
  "::"
] @punctuation.delimiter

[
  "("
  ")"
  "["
  "]"
  "{"
  "}"
] @punctuation.bracket
