;; vim: ft=query
;; extends

; Instruction keywords as base (they're structural)
; FROM is special — image name is a constant, alias is a definition
(from_instruction
  (image_spec
    name: (image_name) @FlamasterConstant))

(from_instruction
  as: (image_alias) @FlamasterDefinition)

; ENV variable names are definitions
(env_instruction
  (env_pair
    name: (unquoted_string) @FlamasterDefinition))

; ARG names are definitions (they define build-time variables)
(arg_instruction
  name: (unquoted_string) @FlamasterDefinition)

; LABEL keys are definitions
(label_instruction
  (label_pair
    key: (attr_key) @FlamasterDefinition))

; EXPOSE port numbers as constants
(expose_instruction
  (expose_port) @FlamasterConstant)

; WORKDIR path as string
(workdir_instruction
  (path) @FlamasterString)

; COPY --from alias as constant reference
(copy_instruction
  (param
    (mount_param_param
      (mount_param_param) @_key
      (#eq? @_key "from")
      (mount_param_param) @FlamasterConstant)))

; SHELL instruction
(shell_instruction
  (json_string_array
    (json_string) @FlamasterString))
