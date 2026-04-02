;; vim: ft=query
;; extends

;; Definitions
(class_declaration
  name: (identifier) @FlamasterDefinition)
(constructor_declaration
  name: (identifier) @FlamasterDefinition)
(method_declaration
  name: (identifier) @FlamasterDefinition)
(package_declaration
  (scoped_identifier) @FlamasterDefinition)
(interface_declaration
  name: (identifier) @FlamasterDefinition)
(enum_declaration
  name: (identifier) @FlamasterDefinition)
(enum_constant
  name: (identifier) @FlamasterDefinition)
(enhanced_for_statement
  name: (identifier) @FlamasterDefinition)
(record_declaration
  name: (identifier) @FlamasterDefinition)

;; Boolean/null literals
(true) @FlamasterLiteral
(false) @FlamasterLiteral
(null_literal) @FlamasterLiteral

;; Annotations
(marker_annotation
  "@" @FlamasterPunct
  name: (identifier) @FlamasterConstant)
(annotation
  "@" @FlamasterPunct
  name: (identifier) @FlamasterConstant)

;; Generic type parameter brackets
(type_parameters "<" @FlamasterPunct)
(type_parameters ">" @FlamasterPunct)
(type_arguments "<" @FlamasterPunct)
(type_arguments ">" @FlamasterPunct)
