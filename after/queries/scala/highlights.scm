; vim: ft=query
;; extends

;; Definitions
(package_clause
  (package_identifier) @FlamasterDefinition)

(function_definition
  name: (identifier) @FlamasterDefinition)

(function_declaration
  name: (identifier) @FlamasterDefinition)

(class_definition
  name: (identifier) @FlamasterDefinition)

(object_definition
  name: (identifier) @FlamasterDefinition)

(trait_definition
  name: (identifier) @FlamasterDefinition)

;; Val/var bindings
(val_definition
  pattern: (identifier) @FlamasterDefinition)
(var_definition
  pattern: (identifier) @FlamasterDefinition)
(val_declaration
  name: (identifier) @FlamasterDefinition)
(var_declaration
  name: (identifier) @FlamasterDefinition)

;; Enum definitions (Scala 3)
(enum_definition
  name: (identifier) @FlamasterDefinition)
(simple_enum_case
  name: (identifier) @FlamasterDefinition)

;; Type definitions
(type_definition
  name: (type_identifier) @FlamasterDefinition)

;; Boolean/null literals
(boolean_literal) @FlamasterLiteral
(null_literal) @FlamasterLiteral

;; Annotations
(annotation
  "@" @FlamasterPunct
  name: (type_identifier) @FlamasterConstant)
