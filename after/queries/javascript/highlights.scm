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
