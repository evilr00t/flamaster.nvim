;; vim: ft=query
;; extends

(function_declarator
  declarator: (qualified_identifier
                name: (identifier) @FlamasterDefinition))

;; TODO there's probably a lot of duplicates here

(function_definition
  declarator: (function_declarator
                declarator: (destructor_name (identifier) @FlamasterDefinition)))

(function_definition
  declarator: (function_declarator
                declarator: (field_identifier) @FlamasterDefinition))

(function_definition
  declarator: (function_declarator
                declarator: (qualified_identifier
                              name: (destructor_name
                                      (identifier) @FlamasterDefinition))))

(declaration
  declarator: (function_declarator
                declarator:
                  (destructor_name (identifier) @FlamasterDefinition)))

(field_declaration
  declarator: (function_declarator
                declarator: (field_identifier) @FlamasterDefinition))

(field_declaration
  declarator: (pointer_declarator
                declarator: (function_declarator
                              declarator:
                                (field_identifier) @FlamasterDefinition)))

(function_declarator
 declarator: (field_identifier) @FlamasterDefinition)

(function_declarator
     declarator: (qualified_identifier
                   name: (identifier) @FlamasterDefinition))
(function_declarator
     declarator: (qualified_identifier
                   name: (qualified_identifier
                           name: (identifier) @FlamasterDefinition)))
((function_declarator
     declarator: (qualified_identifier
                   name: (identifier) @FlamasterDefinition))
 (#lua-match? @FlamasterDefinition "^[A-Z]"))

(labeled_statement
  label: (statement_identifier) @FlamasterDefinition)

(type_definition
  declarator: (type_identifier) @FlamasterDefinition)

(preproc_def
  name: (identifier) @FlamasterDefinition)

(class_specifier
  name: (type_identifier) @FlamasterDefinition)

(struct_specifier
  name: (type_identifier) @FlamasterDefinition)

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
