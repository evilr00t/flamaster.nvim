;; vim: ft=query
;; extends

; Helm built-in objects (Values, Chart, Release, etc.) as constants
(selector_expression
  operand: (field
    name: (identifier) @AlabasterConstant
    (#any-of? @AlabasterConstant
      "Values" "Chart" "Release" "Capabilities" "Files" "Subcharts" "Template")))

(selector_expression
  field: (field_identifier) @AlabasterConstant
  (#any-of? @AlabasterConstant
    "Values" "Chart" "Release" "Capabilities" "Files" "Subcharts" "Template"))

; Template function definitions
(function_declaration
  name: (identifier) @AlabasterDefinition)
