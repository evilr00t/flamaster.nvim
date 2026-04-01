;; vim: ft=query
;; extends

(function_declaration
  name: (identifier) @FlamasterDefinition)

(variable_declarator
  name: (identifier) @FlamasterDefinition
  value: (arrow_function))

(variable_declarator
  name: (identifier) @FlamasterDefinition
  value: (function_expression))

(undefined) @FlamasterConstant

;; Boolean and null constants
(true) @FlamasterConstant
(false) @FlamasterConstant
(null) @FlamasterConstant

;; Class declarations
(class_declaration
  name: (identifier) @FlamasterDefinition)

;; Method definitions
(method_definition
  name: (property_identifier) @FlamasterDefinition)

;; Generator function declarations
(generator_function_declaration
  name: (identifier) @FlamasterDefinition)

;; For-in/for-of loop variables
(for_in_statement
  left: (identifier) @FlamasterDefinition)

;; Shebang line
((program . (hash_bang_line) @FlamasterHashbang))
