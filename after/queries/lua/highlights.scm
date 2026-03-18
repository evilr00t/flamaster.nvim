;; vim: ft=query
;; extends

(function_declaration
  name: (identifier) @FlamasterDefinition)

(assignment_statement
  (variable_list
    name: (dot_index_expression
            field: (identifier) @FlamasterDefinition))
  (expression_list
    value: (function_definition)))

(assignment_statement
  (variable_list
    name: (identifier) @FlamasterDefinition)
  (expression_list
    value: (function_definition)))

(function_declaration
  name: (dot_index_expression
          field: (identifier) @FlamasterDefinition))

(table_constructor
  (field name: (identifier) @FlamasterString))

(hash_bang_line) @FlamasterHashbang
