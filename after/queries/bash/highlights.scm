;; vim: ft=query
;; extends

(function_definition
  name: (word) @FlamasterDefinition)

((program . (comment) @FlamasterHashbang)
 (#match? @FlamasterHashbang "^#!/"))
