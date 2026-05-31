;; vim: ft=query
;; extends

(function_definition
  (function_declaration
    name: (scoped_identifier
            (scope)
            (identifier) @MinimalDefinition)))

(function_definition
  (function_declaration
    name: (identifier) @MinimalDefinition))

[
  "break"
  "continue"
  "return"
  "throw"
] @MinimalControlTransfer
(#set! "priority" 105)

((unknown_builtin_statement
   (unknown_command_name) @MinimalControlTransfer)
 (#eq? @MinimalControlTransfer "finish")
 (#set! "priority" 105))
