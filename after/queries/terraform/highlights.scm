;; vim: ft=query
;; extends

; Terraform magic namespaces (var, local, module, data, output) as constants
(expression
  (variable_expr
    (identifier) @AlabasterConstant
    (#any-of? @AlabasterConstant "var" "local" "module" "data" "output" "path" "terraform")))

; Built-in type keywords as constants
((identifier) @AlabasterConstant
  (#any-of? @AlabasterConstant
    "bool" "string" "number" "object" "tuple" "list" "map" "set" "any"))

; Resource/data source type labels (e.g. "aws_instance") — these are like type names
(body
  (block
    (identifier) @_kw
    (#any-of? @_kw "resource" "data")
    (string_lit
      (template_literal) @AlabasterConstant)))

; Resource logical name (third label) as definition
(body
  (block
    (identifier) @_kw
    (#any-of? @_kw "resource" "data")
    (string_lit)
    (string_lit
      (template_literal) @AlabasterDefinition)))

; Module source names
(body
  (block
    (identifier) @_kw
    (#eq? @_kw "module")
    (string_lit
      (template_literal) @AlabasterDefinition)))

; variable/output block names
(body
  (block
    (identifier) @_kw
    (#any-of? @_kw "variable" "output" "locals" "provider")
    (string_lit
      (template_literal) @AlabasterDefinition)))
