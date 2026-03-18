;; vim: ft=query
;; extends

;; methods
(method
  name: (identifier) @FlamasterDefinition)

;; singleton methods (def self.method)
(singleton_method
  name: (identifier) @FlamasterDefinition)

;; simple classes
(class
  name: (constant) @FlamasterDefinition)

;; modules
(module
  name: (constant) @FlamasterDefinition)

;; all constants in scope_resolution chains (handles any nesting depth)
(scope_resolution
  name: (constant) @FlamasterDefinition)
(scope_resolution
  scope: (constant) @FlamasterDefinition)

((simple_symbol) @FlamasterConstant)
((hash_key_symbol) @FlamasterConstant)

((instance_variable) @FlamasterPunct)
