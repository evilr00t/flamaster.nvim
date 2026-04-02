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

(let_declaration
  pattern: (identifier) @FlamasterDefinition)
(for_expression
  pattern: (identifier) @FlamasterDefinition)
(enum_variant
  name: (identifier) @FlamasterDefinition)
(const_item
  name: (identifier) @FlamasterDefinition)
(static_item
  name: (identifier) @FlamasterDefinition)
(type_item
  name: (type_identifier) @FlamasterDefinition)

(boolean_literal) @FlamasterLiteral

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
(attribute_item
  "#" @FlamasterPunct)
(attribute
  "[" @FlamasterPunct)
(attribute
  "]" @FlamasterPunct)
