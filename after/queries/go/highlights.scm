;; vim: ft=query
;; extends

(package_clause
  (package_identifier) @MinimalDefinition)

(source_file
  (const_declaration
    (const_spec
      name: (identifier) @MinimalDefinition)))

(statement_list
  (const_declaration
    (const_spec
      name: (identifier) @MinimalBinding)))

(function_declaration
  name: (identifier) @MinimalDefinition)

(method_declaration
  name: (field_identifier) @MinimalDefinition)

(parameter_declaration
  name: (identifier) @MinimalBinding)

(short_var_declaration
  left: (expression_list (identifier) @MinimalBinding))

(range_clause
  left: (expression_list (identifier) @MinimalBinding)
  ":=")

(var_declaration
  (var_spec
    name: (identifier) @MinimalBinding))

[
  "default"
  "defer"
  "range"
  "select"
] @MinimalControlStructure
(#set! "priority" 105)

[
  "break"
  "continue"
  "fallthrough"
  "goto"
] @MinimalControlTransfer
(#set! "priority" 105)
