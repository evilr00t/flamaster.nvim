;; vim: ft=query
;; extends

(function_declaration
  name: (identifier) @FlamasterDefinition)

(type_declaration
  (identifier) @FlamasterDefinition)

; Builtin constants
(true) @FlamasterLiteral
(false) @FlamasterLiteral
(null) @FlamasterLiteral
