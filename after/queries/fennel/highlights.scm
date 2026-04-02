;; vim: ft=query
;; extends

; (fn
;   name: (symbol) @FlamasterDefinition)
;   ; TODO: add this when https://github.com/nvim-treesitter/nvim-treesitter/issues/1788 is fixed
;   ; docstring: (string)? @FlamasterComment
; (fn
;   name: (multi_symbol (symbol) @FlamasterDefinition))

; (global
;   (binding
;     (symbol) @FlamasterDefinition))

(list
  (symbol) @function.macro
  (#match? @function.macro "^macro$")
  (symbol) @FlamasterDefinition)


; ((program . (hashfn) @FlamasterHashbang)
;  (#match? @FlamasterHashbang "^#!/")
;  (#set! "priority" 101))

; Builtin constants
(boolean) @FlamasterLiteral
(nil) @FlamasterLiteral
