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

; Type alias (PEP 695, Python 3.12+)
(type_alias_statement
  left: (type
    (identifier) @FlamasterDefinition))

; __all__ exports list
(assignment
  left: (identifier) @FlamasterDefinition
  (#eq? @FlamasterDefinition "__all__"))

; Exception handler variable (except ValueError as e:)
(except_clause
  (as_pattern
    alias: (as_pattern_target
      (identifier) @FlamasterDefinition)))
