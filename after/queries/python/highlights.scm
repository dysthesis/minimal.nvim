;; vim: ft=query
;; extends

(function_definition
  name: (identifier) @MinimalDefinition)
(class_definition
  name: (identifier) @MinimalDefinition)

((module . (comment) @MinimalHashbang)
 (#match? @MinimalHashbang "^#!/"))

(decorator
  (identifier) @MinimalBase)

(parameters
  (identifier) @MinimalBinding)
(default_parameter
  name: (identifier) @MinimalBinding)
(typed_parameter
  (identifier) @MinimalBinding)
(typed_default_parameter
  name: (identifier) @MinimalBinding)
(list_splat_pattern
  (identifier) @MinimalBinding)
(dictionary_splat_pattern
  (identifier) @MinimalBinding)
(for_statement
  left: (identifier) @MinimalBinding)
(as_pattern
  alias: (as_pattern_target (identifier) @MinimalBinding))

"assert" @MinimalControlFlow
(#set! "priority" 105)
