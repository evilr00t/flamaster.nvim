;; vim: ft=query
;; extends

(struct_item
  name: (type_identifier) @AlabasterDefinition)
(enum_item
  name: (type_identifier) @AlabasterDefinition)

(impl_item
  type: (type_identifier) @AlabasterDefinition)

(impl_item
  type: (scoped_type_identifier
          path: (scoped_identifier)
          name: (type_identifier) @AlabasterDefinition))

(impl_item
  body: (declaration_list
          (type_item
            name: (type_identifier) @AlabasterDefinition)))
(impl_item
  type: (generic_type
          type: (type_identifier) @AlabasterDefinition))

(trait_item
  name: (type_identifier) @AlabasterDefinition)

(trait_item
  body: (declaration_list
          (associated_type
            name: (type_identifier) @AlabasterDefinition)))

(trait_item
  body: (declaration_list
          (function_signature_item
            name: (identifier) @AlabasterDefinition)))

(function_item
  name: (identifier) @AlabasterDefinition)

(macro_definition
  name: (identifier) @AlabasterDefinition)

(for_expression
  "in" @AlabasterPunct)
(type_arguments
  "<" @AlabasterPunct)
(type_arguments
  ">" @AlabasterPunct)
(type_parameters
  "<" @AlabasterPunct)
(type_parameters
  ">" @AlabasterPunct)
