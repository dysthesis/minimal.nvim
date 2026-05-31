;; vim: ft=query
;; extends

(function_declaration
  name: (identifier) @MinimalDefinition)

(assignment_statement
  (variable_list
    name: (dot_index_expression
            field: (identifier) @MinimalDefinition))
  (expression_list
    value: (function_definition)))

(assignment_statement
  (variable_list
    name: (identifier) @MinimalDefinition)
  (expression_list
    value: (function_definition)))

(function_declaration
  name: (dot_index_expression
          field: (identifier) @MinimalDefinition))

(table_constructor
  (field name: (identifier) @MinimalString))

(hash_bang_line) @MinimalHashbang

(parameters
  name: (identifier) @MinimalBinding)

(variable_declaration
  (variable_list
    name: (identifier) @MinimalBinding))

(variable_declaration
  (assignment_statement
    (variable_list
      name: (identifier) @MinimalBinding)))

(for_numeric_clause
  name: (identifier) @MinimalBinding)

(for_generic_clause
  (variable_list
    name: (identifier) @MinimalBinding))

[
  "goto"
  "in"
] @MinimalControlFlow
(#set! "priority" 105)

(break_statement) @MinimalControlFlow
(#set! "priority" 105)
