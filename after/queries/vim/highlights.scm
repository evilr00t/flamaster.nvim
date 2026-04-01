;; vim: ft=query
;; extends

(function_definition
  (function_declaration
    name: (scoped_identifier
            (scope)
            (identifier) @FlamasterDefinition)))

(function_definition
  (function_declaration
    name: (identifier) @FlamasterDefinition))

; Command definitions
(command_definition
  name: (command_name) @FlamasterDefinition)
