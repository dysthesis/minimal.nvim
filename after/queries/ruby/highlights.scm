;; vim: ft=query
;; extends

;; methods
(method
  name: (identifier) @MinimalDefinition)

;; singleton methods (def self.method)
(singleton_method
  name: (identifier) @MinimalDefinition)

;; simple classes
(class
  name: (constant) @MinimalDefinition)

;; modules
(module
  name: (constant) @MinimalDefinition)

;; all constants in scope_resolution chains (handles any nesting depth)
(scope_resolution
  name: (constant) @MinimalDefinition)
(scope_resolution
  scope: (constant) @MinimalDefinition)

((simple_symbol) @MinimalConstant)
((hash_key_symbol) @MinimalConstant)

((instance_variable) @MinimalPunctuation)
