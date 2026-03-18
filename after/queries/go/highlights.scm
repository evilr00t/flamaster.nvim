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

; Type definitions: structs, interfaces, type aliases
(type_spec
  name: (type_identifier) @FlamasterDefinition)

; Const names (sentinel errors, iota enums, etc.)
(const_declaration
  (const_spec
    name: (identifier) @FlamasterDefinition))

; iota and nil are builtin constants
[
  (iota)
  (nil)
] @FlamasterConstant
