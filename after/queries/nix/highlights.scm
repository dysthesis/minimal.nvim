;; vim: ft=query
;; extends

(binding
  attrpath: (attrpath (identifier) @MinimalBinding))

(inherit_from
  attrs: (inherited_attrs
           attr: (identifier) @MinimalBinding))

(formal
  name: (identifier) @MinimalBinding
  "?"? @MinimalPunctuation)

(function_expression
  universal: (identifier) @MinimalBinding)

((comment) @MinimalHashbang
 (#match? @MinimalHashbang "^#!/"))

"assert" @MinimalControlFlow
(#set! "priority" 105)
