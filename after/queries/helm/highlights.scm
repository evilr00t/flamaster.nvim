;; vim: ft=query
;; extends

; Helm built-in objects (Values, Chart, Release, etc.) as constants
(selector_expression
  operand: (field
    name: (identifier) @FlamasterConstant
    (#any-of? @FlamasterConstant
      "Values" "Chart" "Release" "Capabilities" "Files" "Subcharts" "Template")))

(selector_expression
  field: (field_identifier) @FlamasterConstant
  (#any-of? @FlamasterConstant
    "Values" "Chart" "Release" "Capabilities" "Files" "Subcharts" "Template"))

; Template action names (define/block)
(define_action
  (interpreted_string_literal) @FlamasterDefinition)

; Pipeline function calls
(function_call
  function: (identifier) @FlamasterBase)

; Pipeline function calls that are constructors/generators
(function_call
  function: (identifier) @FlamasterConstant
  (#any-of? @FlamasterConstant "include" "required" "default" "empty" "fail" "print" "printf" "println"))

; Boolean and nil literals
(true) @FlamasterLiteral
(false) @FlamasterLiteral
(nil) @FlamasterLiteral

; Variable declarations ($var := ...)
(variable_definition
  (variable) @FlamasterDefinition)

; Control flow keywords
(if_action "if" @FlamasterKeyword)
(range_action "range" @FlamasterKeyword)
(with_action "with" @FlamasterKeyword)
(block_action "block" @FlamasterKeyword)
(template_action "template" @FlamasterKeyword)
((else_action) @FlamasterKeyword)
((end_action) @FlamasterKeyword)

; Block action template names (like define but for inheritance)
(block_action
  (interpreted_string_literal) @FlamasterDefinition)

; Template action call name
(template_action
  (interpreted_string_literal) @FlamasterConstant)
