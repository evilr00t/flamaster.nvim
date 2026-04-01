;; vim: ft=query
;; extends

; Terraform magic namespaces (var, local, module, data, output) as constants
(expression
  (variable_expr
    (identifier) @FlamasterConstant
    (#any-of? @FlamasterConstant "var" "local" "module" "data" "output" "path" "terraform")))

; Built-in type keywords as constants
((identifier) @FlamasterConstant
  (#any-of? @FlamasterConstant
    "bool" "string" "number" "object" "tuple" "list" "map" "set" "any"))

; Boolean and null literals
(bool_lit) @FlamasterConstant
(null_lit) @FlamasterConstant

; Resource/data source type labels (e.g. "aws_instance") — these are like type names
(body
  (block
    (identifier) @_kw
    (#any-of? @_kw "resource" "data")
    (string_lit
      (template_literal) @FlamasterConstant)))

; Resource logical name (third label) as definition
(body
  (block
    (identifier) @_kw
    (#any-of? @_kw "resource" "data")
    (string_lit)
    (string_lit
      (template_literal) @FlamasterDefinition)))

; Module source names
(body
  (block
    (identifier) @_kw
    (#eq? @_kw "module")
    (string_lit
      (template_literal) @FlamasterDefinition)))

; variable/output block names
(body
  (block
    (identifier) @_kw
    (#any-of? @_kw "variable" "output" "locals" "provider")
    (string_lit
      (template_literal) @FlamasterDefinition)))

; moved block — from/to addresses
(body
  (block
    (identifier) @_kw
    (#eq? @_kw "moved")
    (body
      (attribute
        (identifier) @_attr
        (#any-of? @_attr "from" "to")
        (expression) @FlamasterConstant))))

; import block — id and to attributes
(body
  (block
    (identifier) @_kw
    (#eq? @_kw "import")
    (body
      (attribute
        (identifier) @_attr
        (#eq? @_attr "to")
        (expression) @FlamasterConstant))))

; check block with custom conditions
(body
  (block
    (identifier) @_kw
    (#eq? @_kw "check")
    (string_lit
      (template_literal) @FlamasterDefinition)))

; lifecycle inner block keywords
(body
  (block
    (identifier) @_kw
    (#eq? @_kw "lifecycle")
    (body
      (attribute
        (identifier) @FlamasterConstant
        (#any-of? @FlamasterConstant
          "create_before_destroy" "prevent_destroy" "ignore_changes"
          "replace_triggered_by" "precondition" "postcondition")))))
