;; vim: ft=query
;; extends

(function_declarator
  declarator: (qualified_identifier
                name: (identifier) @MinimalDefinition))

;; TODO there's probably a lot of duplicates here

(function_definition
  declarator: (function_declarator
                declarator: (destructor_name (identifier) @MinimalDefinition)))

(function_definition
  declarator: (function_declarator
                declarator: (field_identifier) @MinimalDefinition))

(function_definition
  declarator: (function_declarator
                declarator: (qualified_identifier
                              name: (destructor_name
                                      (identifier) @MinimalDefinition))))

(declaration
  declarator: (function_declarator
                declarator:
                  (destructor_name (identifier) @MinimalDefinition)))

(field_declaration
  declarator: (function_declarator
                declarator: (field_identifier) @MinimalDefinition))

(field_declaration
  declarator: (pointer_declarator
                declarator: (function_declarator
                              declarator:
                                (field_identifier) @MinimalDefinition)))

(function_declarator
 declarator: (field_identifier) @MinimalDefinition)

(function_declarator
     declarator: (qualified_identifier
                   name: (identifier) @MinimalDefinition))
(function_declarator
     declarator: (qualified_identifier
                   name: (qualified_identifier
                           name: (identifier) @MinimalDefinition)))
((function_declarator
     declarator: (qualified_identifier
                   name: (identifier) @MinimalDefinition))
 (#lua-match? @MinimalDefinition "^[A-Z]"))

(labeled_statement
  label: (statement_identifier) @MinimalDefinition)

(type_definition
  declarator: (type_identifier) @MinimalDefinition)

(preproc_def
  name: (identifier) @MinimalDefinition)

(class_specifier
  name: (type_identifier) @MinimalDefinition)

(struct_specifier
  name: (type_identifier) @MinimalDefinition)

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
