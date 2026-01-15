;; extends
(list_lit
  value: (sym_lit) @_keyword.function
  (#any-of? @_keyword.function "fn" "fn*" "defn" "defn-")
  value: (sym_lit)? @MinimalDefinition
  value: (vec_lit)
  (str_lit)? @comment)

(list_lit
  value: (sym_lit) @_keyword.function
  (#any-of? @_keyword.function "fn" "fn*" "defn" "defn-")
  value: (sym_lit)? @MinimalDefinition
  value: (list_lit))

(list_lit
  value: (sym_lit) @_keyword.function
  (#eq? @_keyword.function "defmacro")
  value: (sym_lit)? @MinimalDefinition
  value: (vec_lit)
  (str_lit)? @comment)

(list_lit
  value: (sym_lit) @_include
  (#eq? @_include "ns")
  value: (sym_lit) @MinimalDefinition)

(list_lit
  value: (kwd_lit) @MinimalConstant)
(vec_lit
  value: (kwd_lit) @MinimalConstant)
(map_lit
  value: (kwd_lit) @MinimalConstant)
