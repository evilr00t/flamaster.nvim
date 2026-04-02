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

;; Boolean and nil constants
(true) @FlamasterLiteral
(false) @FlamasterLiteral
(nil) @FlamasterLiteral

;; For-in loop variables (for k, v in ...)
(for_statement
  (for_generic_clause
    (variable_list
      (identifier) @FlamasterDefinition)))

;; Numeric for-loop variable (for i = 1, 10 do)
(for_statement
  (for_numeric_clause
    (identifier) @FlamasterDefinition))

;; Method-style function declarations (function Foo:bar())
(function_declaration
  name: (method_index_expression
          method: (identifier) @FlamasterDefinition))

(hash_bang_line) @FlamasterHashbang
