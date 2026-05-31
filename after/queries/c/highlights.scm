;; vim: ft=query
;; extends

(function_declarator
  declarator: (identifier) @MinimalDefinition)
(preproc_function_def
  name: (identifier) @MinimalDefinition)

(type_definition
  type: (struct_specifier
          name: (type_identifier) @MinimalDefinition)
  declarator: (type_identifier) @MinimalDefinition)

(type_definition
  type: (struct_specifier)
  declarator: (type_identifier) @MinimalDefinition)

(type_definition
  type: (enum_specifier)
  declarator: (type_identifier) @MinimalDefinition)

(struct_specifier
  name: (type_identifier) @MinimalDefinition)

(declaration
  type: (struct_specifier
          name: (type_identifier) @MinimalBase))

(enum_specifier
    name: (type_identifier) @MinimalDefinition)

(declaration
  type: (enum_specifier
          name: (type_identifier) @MinimalBase))

(parameter_declaration
  declarator: (identifier) @MinimalBinding)

(parameter_declaration
  declarator: (pointer_declarator
                declarator: (identifier) @MinimalBinding))

(declaration
  declarator: (identifier) @MinimalBinding)

(declaration
  declarator: (init_declarator
                declarator: (identifier) @MinimalBinding))

(declaration
  declarator: (pointer_declarator
                declarator: (identifier) @MinimalBinding))

(declaration
  declarator: (init_declarator
                declarator: (pointer_declarator
                              declarator: (identifier) @MinimalBinding)))

[
  "default"
  "goto"
] @MinimalControlFlow
(#set! "priority" 105)
