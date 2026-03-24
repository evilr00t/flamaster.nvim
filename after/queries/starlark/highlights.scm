;; vim: ft=query
;; extends

; Function definitions
(function_definition
  name: (identifier) @FlamasterDefinition)

; None/True/False as constants
(none) @FlamasterConstant
(true) @FlamasterConstant
(false) @FlamasterConstant

; Decorators — highlight name as constant (statically known symbol)
(decorator
  "@" @FlamasterPunct)

(decorator
  (identifier) @FlamasterConstant)

(decorator
  (attribute
    attribute: (identifier) @FlamasterConstant))

(decorator
  (call
    function: (identifier) @FlamasterConstant))

(decorator
  (call
    function: (attribute
      attribute: (identifier) @FlamasterConstant)))

; Tiltfile built-in resource/config functions — treat as definitions
((call
  function: (identifier) @FlamasterDefinition)
  (#any-of? @FlamasterDefinition
    "k8s_resource"
    "k8s_yaml"
    "k8s_image"
    "k8s_kind"
    "k8s_custom_deploy"
    "docker_build"
    "docker_compose"
    "local_resource"
    "local"
    "blob"
    "read_file"
    "watch_file"
    "watch_settings"
    "include"
    "load_dynamic"
    "helm"
    "helm_resource"
    "helm_remote"
    "secret_settings"
    "update_settings"
    "enable_feature"
    "fallback_trigger_mode"
    "trigger_mode"
    "config.define_string"
    "config.define_bool"
    "config.define_string_list"
    "config.parse"
    "ci_settings"))
