;; vim: ft=query
;; extends

(struct_item
  name: (type_identifier) @MinimalDefinition)
(enum_item
  name: (type_identifier) @MinimalDefinition)

(impl_item
  type: (type_identifier) @MinimalDefinition)

(impl_item
  type: (scoped_type_identifier
          path: (scoped_identifier)
          name: (type_identifier) @MinimalDefinition))

(impl_item
  body: (declaration_list
          (type_item
            name: (type_identifier) @MinimalDefinition)))
(impl_item
  type: (generic_type
          type: (type_identifier) @MinimalDefinition))

(trait_item
  name: (type_identifier) @MinimalDefinition)

(trait_item
  body: (declaration_list
          (associated_type
            name: (type_identifier) @MinimalDefinition)))

(trait_item
  body: (declaration_list
          (function_signature_item
            name: (identifier) @MinimalDefinition)))

(function_item
  name: (identifier) @MinimalDefinition)

(macro_definition
  name: (identifier) @MinimalDefinition)

(for_expression
  "in" @MinimalPunctuation)
(type_arguments
  "<" @MinimalPunctuation)
(type_arguments
  ">" @MinimalPunctuation)
(type_parameters
  "<" @MinimalPunctuation)
(type_parameters
  ">" @MinimalPunctuation)
