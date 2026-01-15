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
