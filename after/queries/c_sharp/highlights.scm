;; vim: ft=query
;; extends

;; Definitions
(type_declaration
  name: (identifier) @FlamasterDefinition)
(constructor_declaration
  name: (identifier) @FlamasterDefinition)
(destructor_declaration
  name: (identifier) @FlamasterDefinition)
(method_declaration
  name: (identifier) @FlamasterDefinition)
(property_declaration
  name: (identifier) @FlamasterDefinition)
(namespace_declaration
  name: (identifier) @FlamasterDefinition)
(enum_member_declaration
  name: (identifier) @FlamasterDefinition)
(foreach_statement
  left: (identifier) @FlamasterDefinition)

;; Boolean/null constants
(boolean_literal) @FlamasterConstant
(null_literal) @FlamasterConstant

;; Attributes
(attribute
  name: (identifier) @FlamasterConstant)
(attribute_list
  "[" @FlamasterPunct
  "]" @FlamasterPunct)

;; Generic type parameter brackets
(type_parameter_list
  "<" @FlamasterPunct
  ">" @FlamasterPunct)
(type_argument_list
  "<" @FlamasterPunct
  ">" @FlamasterPunct)
