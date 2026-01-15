;; vim: ft=query
;; extends

(function_definition
  name: (word) @MinimalDefinition)

((program . (comment) @MinimalHashbang)
 (#match? @MinimalHashbang "^#!/"))
