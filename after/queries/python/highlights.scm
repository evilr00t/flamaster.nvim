;; vim: ft=query
;; extends

; Function and class definitions
(function_definition
  name: (identifier) @FlamasterDefinition)

(class_definition
  name: (identifier) @FlamasterDefinition)

; Decorators are like type annotations — highlight name as constant
(decorator
  "@" @FlamasterPunct)

(decorator
  (identifier) @FlamasterConstant)

(decorator
  (attribute
    attribute: (identifier) @FlamasterConstant))

(decorator
  (call
    function: (identifier) @FlamasterConstant))

(decorator
  (call
    function: (attribute
      attribute: (identifier) @FlamasterConstant)))

; None/True/False as constants (the upstream query uses @boolean/@constant.builtin
; which both resolve to FlamasterBase; make them explicit)
(none) @FlamasterConstant
(true) @FlamasterConstant
(false) @FlamasterConstant

; Shebang line
((module . (comment) @FlamasterHashbang)
 (#match? @FlamasterHashbang "^#!/"))
