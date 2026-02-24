;; vim: ft=query
;; extends

; Function and class definitions
(function_definition
  name: (identifier) @AlabasterDefinition)

(class_definition
  name: (identifier) @AlabasterDefinition)

; Decorators are like type annotations — highlight name as constant
(decorator
  "@" @AlabasterPunct)

(decorator
  (identifier) @AlabasterConstant)

(decorator
  (attribute
    attribute: (identifier) @AlabasterConstant))

(decorator
  (call
    function: (identifier) @AlabasterConstant))

(decorator
  (call
    function: (attribute
      attribute: (identifier) @AlabasterConstant)))

; None/True/False as constants (the upstream query uses @boolean/@constant.builtin
; which both resolve to AlabasterBase; make them explicit)
(none) @AlabasterConstant
(true) @AlabasterConstant
(false) @AlabasterConstant

; Shebang line
((module . (comment) @AlabasterHashbang)
 (#match? @AlabasterHashbang "^#!/"))
