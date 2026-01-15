;; vim: ft=query
;; extends

; (fn
;   name: (symbol) @MinimalDefinition)
;   ; TODO: add this when https://github.com/nvim-treesitter/nvim-treesitter/issues/1788 is fixed
;   ; docstring: (string)? @MinimalComment
; (fn
;   name: (multi_symbol (symbol) @MinimalDefinition))

; (global
;   (binding
;     (symbol) @MinimalDefinition))

(list
  (symbol) @function.macro
  (#match? @function.macro "^macro$")
  (symbol) @MinimalDefinition)


; ((program . (hashfn) @MinimalHashbang)
;  (#match? @MinimalHashbang "^#!/")
;  (#set! "priority" 101))
