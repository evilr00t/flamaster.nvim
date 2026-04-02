;; vim: ft=query
;; extends

;; Definitions
(function_declaration
  (simple_identifier) @FlamasterDefinition)

(class_declaration
  (type_identifier) @FlamasterDefinition)

(object_declaration
  (type_identifier) @FlamasterDefinition)

(interface_declaration
  (type_identifier) @FlamasterDefinition)

(enum_entry
  (simple_identifier) @FlamasterDefinition)

(for_statement
  (variable_declaration
    (simple_identifier) @FlamasterDefinition))

;; Strings
(string_literal) @FlamasterString

;; Constants
(boolean_literal) @FlamasterLiteral
(null_literal) @FlamasterLiteral
(integer_literal) @FlamasterLiteral
(long_literal) @FlamasterLiteral
(unsigned_literal) @FlamasterLiteral
(real_literal) @FlamasterLiteral

;; Comments
(line_comment) @Comment
(multiline_comment) @Comment

;; Annotations
(modifiers (annotation
  "@" @FlamasterPunct
  (user_type (type_identifier) @FlamasterConstant)))
