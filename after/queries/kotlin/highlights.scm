;; vim: ft=query
;; extends
(function_declaration
  (simple_identifier) @FlamasterDefinition)

(class_declaration
  (type_identifier) @FlamasterDefinition)

(object_declaration
  (type_identifier) @FlamasterDefinition)

(string_literal) @FlamasterString

(boolean_literal) @FlamasterConstant
(integer_literal) @FlamasterConstant
(long_literal) @FlamasterConstant
(unsigned_literal) @FlamasterConstant
(real_literal) @FlamasterConstant

(line_comment) @Comment
(multiline_comment) @Comment

(modifiers (annotation (user_type (type_identifier) @FlamasterPunct)))
