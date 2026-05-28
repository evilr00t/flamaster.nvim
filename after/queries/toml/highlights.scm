;; vim: ft=query
;; extends

; Table headers [section] — these are like definitions
(table
  (bare_key) @FlamasterDefinition)

(table
  (dotted_key
    (bare_key) @FlamasterDefinition))

(table
  (quoted_key) @FlamasterDefinition)

; Array table headers [[section]]
(table_array_element
  (bare_key) @FlamasterDefinition)

(table_array_element
  (dotted_key
    (bare_key) @FlamasterDefinition))

(table_array_element
  (quoted_key) @FlamasterDefinition)

; Dotted keys in assignments
(pair
  (dotted_key
    (bare_key) @FlamasterDefinition))

; Top-level pair keys
(pair
  (bare_key) @FlamasterBase)

(pair
  (quoted_key) @FlamasterBase)

; Boolean values
(boolean) @FlamasterLiteral

; Numeric values
(integer) @FlamasterLiteral
(float) @FlamasterLiteral

; Datetime values (ISO 8601 / RFC 3339)
(offset_date_time) @FlamasterLiteral
(local_date_time) @FlamasterLiteral
(local_date) @FlamasterLiteral
(local_time) @FlamasterLiteral
