;; vim: ft=query
;; extends

; Mapping keys are the structural landmarks — highlight as definitions
(block_mapping_pair
  key: (flow_node
    (plain_scalar
      (string_scalar) @AlabasterDefinition)))

(block_mapping_pair
  key: (flow_node
    [
      (double_quote_scalar)
      (single_quote_scalar)
    ] @AlabasterDefinition))

; Flow mapping keys
(flow_mapping
  (_
    key: (flow_node
      (plain_scalar
        (string_scalar) @AlabasterDefinition))))

(flow_mapping
  (_
    key: (flow_node
      [
        (double_quote_scalar)
        (single_quote_scalar)
      ] @AlabasterDefinition)))

; Anchors and aliases are constants (named references)
(anchor_name) @AlabasterConstant
(alias_name) @AlabasterConstant

; Tags are constants (type annotations)
(tag) @AlabasterConstant

; YAML document markers are punctuation
[
  "---"
  "..."
] @AlabasterPunct
