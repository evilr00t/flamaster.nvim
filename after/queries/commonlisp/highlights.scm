;; vim: ft=query
;; extends

(defun
  (defun_header
    function_name: (sym_lit) @FlamasterDefinition))

; Other definition forms
(list_lit
  value: (sym_lit) @_kw
  (#any-of? @_kw "defmacro" "defgeneric" "defmethod")
  value: (sym_lit) @FlamasterDefinition)

(list_lit
  value: (sym_lit) @_kw
  (#any-of? @_kw "defvar" "defparameter" "defconstant" "defonce")
  value: (sym_lit) @FlamasterDefinition)

(list_lit
  value: (sym_lit) @_kw
  (#any-of? @_kw "defclass" "defstruct" "deftype" "define-condition")
  value: (sym_lit) @FlamasterDefinition)

(list_lit
  value: (sym_lit) @_kw
  (#eq? @_kw "defpackage")
  value: (sym_lit) @FlamasterDefinition)

; Keywords are constants (like Clojure)
(kwd_lit) @FlamasterConstant
