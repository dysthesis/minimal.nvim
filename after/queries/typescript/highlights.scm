;; vim: ft=query
;; extends

(interface_declaration
  name: (type_identifier) @MinimalDefinition)

(method_definition
  name: (property_identifier) @MinimalDefinition)

(function_declaration
  name: (identifier) @MinimalDefinition)

(variable_declarator
  name: (identifier) @MinimalDefinition
  value: (arrow_function))

(type_alias_declaration
  name: (type_identifier) @MinimalDefinition)

(undefined) @MinimalConstant
