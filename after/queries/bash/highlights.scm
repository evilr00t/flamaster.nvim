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

;; local/declare/export/readonly variable names
(declaration_command
  (variable_assignment
    name: (variable_name) @FlamasterDefinition))

;; trap handler name
(command
  name: (word) @_trap
  (#eq? @_trap "trap")
  argument: (word) @FlamasterConstant .)

;; Heredoc delimiter names
(heredoc_redirect
  (heredoc_start) @FlamasterConstant)

;; true/false builtins
((word) @FlamasterLiteral
 (#any-of? @FlamasterLiteral "true" "false"))
