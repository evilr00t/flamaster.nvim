;; vim: ft=query
;; extends

; Top-level block type (resource, data, module, variable, output, locals, provider, terraform)
(body
  (block
    (identifier) @FlamasterBase))

; Second label: resource type (e.g. "aws_instance") — treat as constant (it's a known symbol)
(body
  (block
    (string_lit
      (template_literal) @FlamasterConstant)))

; Third label: resource name / logical name — treat as definition
(body
  (block
    (identifier) @_block_type
    (string_lit) @_resource_type
    (string_lit
      (template_literal) @FlamasterDefinition)))

; Attribute keys
(attribute
  (identifier) @FlamasterBase)

; Object element keys
(object_elem
  key: (expression
    (variable_expr
      (identifier) @FlamasterBase)))

; Function names (calling a function is a reference, not a definition)
(function_call
  (identifier) @FlamasterBase)

; Boolean and null literals
(bool_lit) @FlamasterLiteral
(null_lit) @FlamasterLiteral

; Variable references (var.x, local.x, module.x, data.x)
(expression
  (variable_expr
    (identifier) @FlamasterBase))
