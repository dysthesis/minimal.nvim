;; vim: ft=query
;; extends

(function_definition
  name: (word) @MinimalDefinition)

(command
  name: (word) @function.builtin
  (#match? @function.builtin "^set$")
  argument: (word) @parameter
  (#any-of? @parameter "-g" "--global" "-U" "--universal" "-x" "--export")
  argument: (word) @MinimalDefinition
  argument: (_))

((program . (comment) @MinimalHashbang)
 (#match? @MinimalHashbang "^#!/"))
