;; vim: ft=query
;; extends

(struct_item
  name: (type_identifier) @FlamasterDefinition)
(enum_item
  name: (type_identifier) @FlamasterDefinition)

(impl_item
  type: (type_identifier) @FlamasterDefinition)

(impl_item
  type: (scoped_type_identifier
          path: (scoped_identifier)
          name: (type_identifier) @FlamasterDefinition))

(impl_item
  body: (declaration_list
          (type_item
            name: (type_identifier) @FlamasterDefinition)))
(impl_item
  type: (generic_type
          type: (type_identifier) @FlamasterDefinition))

(trait_item
  name: (type_identifier) @FlamasterDefinition)

(trait_item
  body: (declaration_list
          (associated_type
            name: (type_identifier) @FlamasterDefinition)))

(trait_item
  body: (declaration_list
          (function_signature_item
            name: (identifier) @FlamasterDefinition)))

(function_item
  name: (identifier) @FlamasterDefinition)

(macro_definition
  name: (identifier) @FlamasterDefinition)

(for_expression
  "in" @FlamasterPunct)
(type_arguments
  "<" @FlamasterPunct)
(type_arguments
  ">" @FlamasterPunct)
(type_parameters
  "<" @FlamasterPunct)
(type_parameters
  ">" @FlamasterPunct)
