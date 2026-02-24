;; vim: ft=query
;; extends

; Top-level block type (resource, data, module, variable, output, locals, provider, terraform)
(body
  (block
    (identifier) @AlabasterBase))

; Second label: resource type (e.g. "aws_instance") — treat as constant (it's a known symbol)
(body
  (block
    (string_lit
      (template_literal) @AlabasterConstant)))

; Third label: resource name / logical name — treat as definition
(body
  (block
    (identifier) @_block_type
    (string_lit) @_resource_type
    (string_lit
      (template_literal) @AlabasterDefinition)))

; Attribute keys
(attribute
  (identifier) @AlabasterBase)

; Object element keys
(object_elem
  key: (expression
    (variable_expr
      (identifier) @AlabasterBase)))

; Function names
(function_call
  (identifier) @AlabasterDefinition)

; Variable references (var.x, local.x, module.x, data.x)
(expression
  (variable_expr
    (identifier) @AlabasterBase))
