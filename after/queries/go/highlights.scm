;; vim: ft=query
;; extends

; Package name
(package_clause
  (package_identifier) @AlabasterDefinition)

; Function and method declarations
(function_declaration
  name: (identifier) @AlabasterDefinition)

(method_declaration
  name: (field_identifier) @AlabasterDefinition)

; Type definitions: structs, interfaces, type aliases
(type_spec
  name: (type_identifier) @AlabasterDefinition)

; Const names (sentinel errors, iota enums, etc.)
(const_declaration
  (const_spec
    name: (identifier) @AlabasterDefinition))

; iota and nil are builtin constants
[
  (iota)
  (nil)
] @AlabasterConstant
