;; vim: ft=query
;; extends

; fn/defn/defn- with optional docstring
(list_lit
  value: (sym_lit) @_kw
  (#any-of? @_kw "fn" "fn*" "defn" "defn-")
  value: (sym_lit)? @FlamasterDefinition
  value: (vec_lit)
  (str_lit)? @comment)

(list_lit
  value: (sym_lit) @_kw
  (#any-of? @_kw "fn" "fn*" "defn" "defn-")
  value: (sym_lit)? @FlamasterDefinition
  value: (list_lit))

; defmacro
(list_lit
  value: (sym_lit) @_kw
  (#eq? @_kw "defmacro")
  value: (sym_lit)? @FlamasterDefinition
  value: (vec_lit)
  (str_lit)? @comment)

; ns declaration name
(list_lit
  value: (sym_lit) @_kw
  (#eq? @_kw "ns")
  value: (sym_lit) @FlamasterDefinition)

; defprotocol, defrecord, deftype, definterface, defmulti names
(list_lit
  value: (sym_lit) @_kw
  (#any-of? @_kw
    "defprotocol" "defrecord" "deftype" "definterface"
    "defmulti" "defstruct" "definline")
  value: (sym_lit) @FlamasterDefinition)

; def / defonce (top-level var definitions)
(list_lit
  value: (sym_lit) @_kw
  (#any-of? @_kw "def" "defonce")
  value: (sym_lit) @FlamasterDefinition)

; Keywords are constants everywhere
(list_lit
  value: (kwd_lit) @FlamasterConstant)
(vec_lit
  value: (kwd_lit) @FlamasterConstant)
(map_lit
  value: (kwd_lit) @FlamasterConstant)
; Also as map keys (the most common use)
(map_lit
  key: (kwd_lit) @FlamasterConstant)
