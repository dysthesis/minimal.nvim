;; vim: ft=query
;; extends
(function_declaration
  (simple_identifier) @MinimalDefinition)

(class_declaration
  (type_identifier) @MinimalDefinition)

(object_declaration
  (type_identifier) @MinimalDefinition)

(string_literal) @MinimalString

(boolean_literal) @MinimalConstant
(integer_literal) @MinimalConstant
(long_literal) @MinimalConstant
(unsigned_literal) @MinimalConstant
(real_literal) @MinimalConstant

(line_comment) @MinimalHashbang
(multiline_comment) @Comment


(modifiers (annotation (user_type (type_identifier) @MinimalPunctuation)))
