;; vim: ft=query
;; extends

(function_declaration
  name: (identifier) @MinimalDefinition)

(parameter
  name: (identifier) @MinimalBinding)

(variable_declaration
  "var" . (identifier) @MinimalBinding)
(variable_declaration
  "const" . (identifier) @MinimalBinding)

(payload
  (identifier) @MinimalBinding)

[
  "defer"
  "errdefer"
] @MinimalControlFlow
(#set! "priority" 105)
