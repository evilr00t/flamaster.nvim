;; vim: ft=query
;; extends

; Mapping keys are the structural landmarks — highlight as definitions
(block_mapping_pair
  key: (flow_node
    (plain_scalar
      (string_scalar) @FlamasterDefinition)))

(block_mapping_pair
  key: (flow_node
    [
      (double_quote_scalar)
      (single_quote_scalar)
    ] @FlamasterDefinition))

; Flow mapping keys
(flow_mapping
  (_
    key: (flow_node
      (plain_scalar
        (string_scalar) @FlamasterDefinition))))

(flow_mapping
  (_
    key: (flow_node
      [
        (double_quote_scalar)
        (single_quote_scalar)
      ] @FlamasterDefinition)))

; Anchors and aliases are constants (named references)
(anchor_name) @FlamasterConstant
(alias_name) @FlamasterConstant

; Tags are constants (type annotations)
(tag) @FlamasterConstant

; YAML document markers are punctuation
[
  "---"
  "..."
] @FlamasterPunct

; Literal scalar values
(boolean_scalar) @FlamasterLiteral
(null_scalar) @FlamasterLiteral
(integer_scalar) @FlamasterLiteral
(float_scalar) @FlamasterLiteral
