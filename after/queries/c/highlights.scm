;; vim: ft=query
;; extends

(function_declarator
  declarator: (identifier) @FlamasterDefinition)
(preproc_function_def
  name: (identifier) @FlamasterDefinition)

(type_definition
  type: (struct_specifier
          name: (type_identifier) @FlamasterDefinition)
  declarator: (type_identifier) @FlamasterDefinition)

(type_definition
  type: (struct_specifier)
  declarator: (type_identifier) @FlamasterDefinition)

(type_definition
  type: (enum_specifier)
  declarator: (type_identifier) @FlamasterDefinition)

(struct_specifier
  name: (type_identifier) @FlamasterDefinition)

(declaration
  type: (struct_specifier
          name: (type_identifier) @FlamasterBase))

(enum_specifier
    name: (type_identifier) @FlamasterDefinition)

(declaration
  type: (enum_specifier
          name: (type_identifier) @FlamasterBase))
