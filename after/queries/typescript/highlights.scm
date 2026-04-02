;; vim: ft=query
;; extends

(interface_declaration
  name: (type_identifier) @FlamasterDefinition)

(method_definition
  name: (property_identifier) @FlamasterDefinition)

(function_declaration
  name: (identifier) @FlamasterDefinition)

(variable_declarator
  name: (identifier) @FlamasterDefinition
  value: (arrow_function))

(type_alias_declaration
  name: (type_identifier) @FlamasterDefinition)

(undefined) @FlamasterLiteral

;; Boolean and null literals
(true) @FlamasterLiteral
(false) @FlamasterLiteral
(null) @FlamasterLiteral

;; Class declarations
(class_declaration
  name: (type_identifier) @FlamasterDefinition)

;; Enum declarations and members
(enum_declaration
  name: (identifier) @FlamasterDefinition)

(enum_body
  (property_identifier) @FlamasterDefinition)
(enum_body
  (enum_assignment
    (property_identifier) @FlamasterDefinition))

;; Variable declarator with function expression
(variable_declarator
  name: (identifier) @FlamasterDefinition
  value: (function_expression))

;; Generic type parameter brackets
(type_parameters "<" @FlamasterPunct)
(type_parameters ">" @FlamasterPunct)
(type_arguments "<" @FlamasterPunct)
(type_arguments ">" @FlamasterPunct)

;; Decorator syntax
(decorator "@" @FlamasterPunct)
(decorator (identifier) @FlamasterConstant)
(decorator (call_expression function: (identifier) @FlamasterConstant))

;; For-in/for-of loop variables
(for_in_statement
  left: (identifier) @FlamasterDefinition)
