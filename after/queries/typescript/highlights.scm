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

(undefined) @FlamasterConstant
