;; vim: ft=query
;; extends

(package_clause
  (package_identifier) @MinimalDefinition)

(const_declaration
  (const_spec
    name: (identifier) @MinimalDefinition))

(function_declaration
  name: (identifier) @MinimalDefinition)

(method_declaration
  name: (field_identifier) @MinimalDefinition)
