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

; Prerequisites (dependencies) are base text — visible but not dominant
(rule
  (prerequisites
    (word) @FlamasterBase))

; Special targets (.PHONY, .SUFFIXES, etc.) — override plain definition color
(rule
  (targets
    (word) @FlamasterConstant
    (#match? @FlamasterConstant "^\\.")))

; Conditional directive keywords
(ifdef_directive "ifdef" @FlamasterKeyword)
(ifdef_directive "ifndef" @FlamasterKeyword)
(ifeq_directive "ifeq" @FlamasterKeyword)
(ifeq_directive "ifneq" @FlamasterKeyword)
((else_directive) @FlamasterKeyword)
((endif_directive) @FlamasterKeyword)

; include paths
(include_directive
  (list
    (word) @FlamasterString))
