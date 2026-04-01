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

; For-loop variable
(for_statement
  variable: (variable_name) @FlamasterDefinition)

; Local set variable (set without scope flags)
(command
  name: (word) @_cmd
  (#eq? @_cmd "set")
  argument: (word) @FlamasterDefinition)
