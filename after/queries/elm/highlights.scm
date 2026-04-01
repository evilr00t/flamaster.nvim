;; vim: ft=query
;; extends

;; Functions
(type_annotation
  (lower_case_identifier) @FlamasterDefinition)

(function_declaration_left
  (lower_case_identifier) @FlamasterDefinition)

(port_annotation
  (lower_case_identifier) @FlamasterDefinition)

;; Types
(type_declaration
  (upper_case_identifier) @FlamasterDefinition)

(type_alias_declaration
  name: (upper_case_identifier) @FlamasterDefinition)

;; Module declaration
(module_declaration
  (upper_case_qid) @FlamasterDefinition)

;; Union type variant constructors
(union_variant
  (upper_case_identifier) @FlamasterDefinition)
