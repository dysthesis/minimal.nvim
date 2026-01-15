;; vim: ft=query
;; extends

(binding
  attrpath: (attrpath (identifier) @MinimalDefinition))

(inherit_from
  attrs: (inherited_attrs
           attr: (identifier) @MinimalDefinition))

(formal
  name: (identifier) @MinimalDefinition
  "?"? @MinimalPunctuation)

(function_expression
  universal: (identifier) @MinimalDefinition)

((comment) @MinimalHashbang
 (#match? @MinimalHashbang "^#!/"))
