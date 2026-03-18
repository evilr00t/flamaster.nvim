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

; Function names
(function_call
  (identifier) @FlamasterDefinition)

; Variable references (var.x, local.x, module.x, data.x)
(expression
  (variable_expr
    (identifier) @FlamasterBase))
