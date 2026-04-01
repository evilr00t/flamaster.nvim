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

; Template function definitions
(function_declaration
  name: (identifier) @FlamasterDefinition)

; Template action names (define/template/block)
(template
  name: (interpreted_string_literal) @FlamasterDefinition)

; Pipeline function calls
(function_call
  function: (identifier) @FlamasterBase)

; Pipeline function calls that are constructors/generators
(function_call
  function: (identifier) @FlamasterConstant
  (#any-of? @FlamasterConstant "include" "required" "default" "empty" "fail" "print" "printf" "println"))

; Boolean and nil literals
(true) @FlamasterConstant
(false) @FlamasterConstant
(nil) @FlamasterConstant

; Variable declarations ($var := ...)
(variable_definition
  (variable) @FlamasterDefinition)
