;; vim: ft=query
;; extends

; Package name
(package_clause
  (package_identifier) @FlamasterDefinition)

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

; Type definitions: structs, interfaces, type aliases
(type_spec
  name: (type_identifier) @FlamasterDefinition)

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
] @FlamasterConstant

; Var block declarations (parallel to const)
(var_declaration
  (var_spec
    name: (identifier) @FlamasterDefinition))

; Interface method specs
(interface_type
  (method_spec
    name: (field_identifier) @FlamasterDefinition))

; Struct field tags (backtick strings like `json:"name"`)
(field_declaration
  tag: (raw_string_literal) @FlamasterConstant)

; Short variable declarations (:=) — LHS names
(short_var_declaration
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
