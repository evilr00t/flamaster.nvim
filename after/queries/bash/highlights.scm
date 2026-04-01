;; vim: ft=query
;; extends

(function_definition
  name: (word) @FlamasterDefinition)

((program . (comment) @FlamasterHashbang)
 (#match? @FlamasterHashbang "^#!/"))

;; Variable assignments (FOO=bar)
(variable_assignment
  name: (variable_name) @FlamasterDefinition)

;; For-loop variable (for i in ...)
(for_statement
  variable: (variable_name) @FlamasterDefinition)

;; Special variables ($?, $#, $@, etc.)
(special_variable_name) @FlamasterConstant
