;; vim: ft=query
;; extends

; Package name
(package_clause
  (package_identifier) @FlamasterDefinition)

; Import alias names (import myfmt "fmt")
(import_spec
  name: (package_identifier) @FlamasterDefinition)

; Function and method declarations
(function_declaration
  name: (identifier) @FlamasterDefinition)

(method_declaration
  name: (field_identifier) @FlamasterDefinition)

; Receiver parameter name
(method_declaration
  receiver: (parameter_list
    (parameter_declaration
      name: (identifier) @FlamasterDefinition)))

; Function/method parameter names
(parameter_declaration
  name: (identifier) @FlamasterDefinition)
(variadic_parameter_declaration
  name: (identifier) @FlamasterDefinition)

; Type definitions: structs, interfaces, type aliases
(type_spec
  name: (type_identifier) @FlamasterDefinition)

; Type parameter names in generics ([T any])
(type_parameter_declaration
  name: (identifier) @FlamasterDefinition)

; Const names (sentinel errors, iota enums, etc.)
(const_declaration
  (const_spec
    name: (identifier) @FlamasterDefinition))

; Builtin constants
[
  (iota)
  (nil)
  (true)
  (false)
] @FlamasterLiteral

; Numeric and rune literals
(int_literal) @FlamasterLiteral
(float_literal) @FlamasterLiteral
(imaginary_literal) @FlamasterLiteral
(rune_literal) @FlamasterLiteral

; Var block declarations (parallel to const)
(var_declaration
  (var_spec
    name: (identifier) @FlamasterDefinition))

; Interface method names (method_elem replaced method_spec in tree-sitter-go)
(method_elem
  name: (field_identifier) @FlamasterDefinition)

; Struct field names
(field_declaration
  name: (field_identifier) @FlamasterDefinition)

; Struct field tags (backtick or quoted strings like `json:"name"`)
(field_declaration
  tag: (raw_string_literal) @FlamasterConstant)
(field_declaration
  tag: (interpreted_string_literal) @FlamasterConstant)

; Short variable declarations (:=) — LHS names
(short_var_declaration
  left: (expression_list
    (identifier) @FlamasterDefinition))

; Type switch alias (switch v := x.(type))
(type_switch_statement
  alias: (expression_list
    (identifier) @FlamasterDefinition))

; Select receive LHS (case v, ok := <-ch:)
(receive_statement
  left: (expression_list
    (identifier) @FlamasterDefinition))

; For-range loop variables
(range_clause
  left: (expression_list
    (identifier) @FlamasterDefinition))

; Label definitions
(labeled_statement
  label: (label_name) @FlamasterDefinition)

; Generic type parameter brackets
(type_parameter_list
  "[" @FlamasterPunct)
(type_parameter_list
  "]" @FlamasterPunct)

; Structural keywords → purple (via @FlamasterKeyword)
(["func" "return" "defer" "go" "select" "chan" "map" "struct" "interface" "type" "const" "var" "package" "import" "fallthrough"] @FlamasterKeyword
 (#set! priority 101))

; Control flow keywords → plain foreground (via @FlamasterBase)
(["if" "else" "for" "range" "switch" "case" "default" "break" "continue" "goto"] @FlamasterBase
 (#set! priority 101))
