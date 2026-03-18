;; vim: ft=query
;; extends

(function_definition
  name: (word) @FlamasterDefinition)

(command
  name: (word) @function.builtin
  (#match? @function.builtin "^set$")
  argument: (word) @parameter
  (#any-of? @parameter "-g" "--global" "-U" "--universal" "-x" "--export")
  argument: (word) @FlamasterDefinition
  argument: (_))

((program . (comment) @FlamasterHashbang)
 (#match? @FlamasterHashbang "^#!/"))
