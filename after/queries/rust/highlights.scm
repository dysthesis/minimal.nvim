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

(parameter
  pattern: (identifier) @MinimalBinding)

(self_parameter
  (self) @MinimalBinding)

(let_declaration
  pattern: (identifier) @MinimalBinding)

(for_expression
  pattern: (identifier) @MinimalBinding)

(tuple_pattern
  (identifier) @MinimalBinding)

(mut_pattern
  (identifier) @MinimalBinding)

(field_pattern
  name: (shorthand_field_identifier) @MinimalBinding)
(field_pattern
  pattern: (identifier) @MinimalBinding)

(match_pattern
  (identifier) @MinimalBinding)

(tuple_struct_pattern
  type: (identifier)
  (identifier) @MinimalBinding)

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
