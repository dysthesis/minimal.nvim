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
