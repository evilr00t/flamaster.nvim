;; vim: ft=query
;; extends

; Target names are definitions (the "function name" of a rule)
(rule
  (targets
    (word) @AlabasterDefinition))

; Variable assignment names are definitions
(variable_assignment
  name: (word) @AlabasterDefinition)

(shell_assignment
  name: (word) @AlabasterDefinition)

(define_directive
  name: (word) @AlabasterDefinition)

; Variable references inside recipes/values are base text
(variable_reference
  (word) @AlabasterBase)

; Built-in automatic variable characters stand out as constants
(automatic_variable
  _ @AlabasterConstant
  (#set! priority 106))

; Shebang-style comments in recipe lines
((comment) @AlabasterHashbang
 (#match? @AlabasterHashbang "^#!/"))
