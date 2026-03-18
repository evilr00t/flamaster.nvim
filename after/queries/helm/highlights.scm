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
