;; vim: ft=query
;; extends

; Target names are definitions (the "function name" of a rule)
(rule
  (targets
    (word) @FlamasterDefinition))

; Variable assignment names are definitions
(variable_assignment
  name: (word) @FlamasterDefinition)

(shell_assignment
  name: (word) @FlamasterDefinition)

(define_directive
  name: (word) @FlamasterDefinition)

; Variable references inside recipes/values are base text
(variable_reference
  (word) @FlamasterBase)

; Built-in automatic variable characters stand out as constants
(automatic_variable
  _ @FlamasterConstant
  (#set! priority 106))

; Shebang-style comments in recipe lines
((comment) @FlamasterHashbang
 (#match? @FlamasterHashbang "^#!/"))
