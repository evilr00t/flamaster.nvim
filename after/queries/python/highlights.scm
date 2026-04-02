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

; None/True/False as literals (the upstream query uses @boolean/@constant.builtin
; which both resolve to FlamasterBase; make them explicit)
(none) @FlamasterLiteral
(true) @FlamasterLiteral
(false) @FlamasterLiteral

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

; For-loop variables (for x in ..., for x, y in ..., for (x, y) in ...)
(for_statement
  left: (identifier) @FlamasterDefinition)
(for_statement
  left: (pattern_list (identifier) @FlamasterDefinition))
(for_statement
  left: (tuple_pattern (identifier) @FlamasterDefinition))

; Comprehension variables ([x for x in ...], {k: v for k, v in ...})
(for_in_clause
  left: (identifier) @FlamasterDefinition)
(for_in_clause
  left: (pattern_list (identifier) @FlamasterDefinition))
(for_in_clause
  left: (tuple_pattern (identifier) @FlamasterDefinition))

; With-statement variable (with open(...) as f:)
(with_clause
  (with_item
    value: (as_pattern
      alias: (as_pattern_target
        (identifier) @FlamasterDefinition))))
