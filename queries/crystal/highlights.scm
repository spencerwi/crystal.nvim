; Variables
(identifier) @variable
(interpolation
  "#{" @punctuation.special
  "}" @punctuation.special) @none

; Keywords

[
 "alias"
 "begin"
 "break"
 "class"
 "def"
 "do"
 "end"
 "ensure"
 "module"
 "next"
 "rescue"
 "retry"
 "then"
 "spawn"
 ] @keyword

[
 "return"
 "yield"
] @keyword.return

[
 "and"
 "or"
 "in"
 "as"
 "of"
] @keyword.operator

[
 "case"
 "else"
 "elsif"
 "if"
 "unless"
 "when"
 ] @conditional

[
 "for"
 "until"
 "while"
 ] @repeat

(constant) @type

((identifier) @keyword
 (#vim-match? @keyword "^(private|protected|public)$"))

[
 "rescue"
 "ensure"
 ] @exception

((identifier) @exception
 (#vim-match? @exception "^(fail|raise)$"))

; Function calls

"defined?" @function

(call
   receiver: (constant)? @type
   method: [
            (identifier)
            (constant)
            ] @function
   )

(program
 (call
  (identifier) @include)
 (#vim-match? @include "^(require|require_relative|load)$"))

; Function definitions

(alias (identifier) @function)
(setter (identifier) @function)

(method_def name: [
               (identifier) @function
               (constant) @type
               ])

(singleton_method name: [
                         (identifier) @function
                         (constant) @type
                         ])

(class_def name: (constant) @type)
(module_def name: (constant) @type)
(class_def superclass: (constant) @type)

; Identifiers
[
 (class_var)
 (instance_var)
 ] @label

((identifier) @constant.builtin
 (#vim-match? @constant.builtin "^__(callee|dir|id|method|send|ENCODING|FILE|LINE)__$"))

((constant) @type
 (#vim-match? @type "^[A-Z\\d_]+$"))

[
 (self)
 (super)
 ] @variable.builtin

(param (identifier) @parameter)

; Literals

[
 (string)
 ] @string

; [
; (bare_symbol)
; (heredoc_beginning)
; (heredoc_end)
; ] @constant

; (regex) @string.regex
(string_escape_sequence) @string.escape
(chqr_escape_sequence) @string.escape
(integer) @number
(float) @float

[
 (nil)
 (true)
 (false)
 ] @boolean

(comment) @comment

; Operators

[
 "="
 "=>"
 "->"
 "+"
 "-"
 "*"
 "/"
 ] @operator

[
 ","
 ";"
 "."
 ] @punctuation.delimiter

[
 "("
 ")"
 "["
 "]"
 "{"
 "}"
 "%w("
 "%i("
 ] @punctuation.bracket

(ERROR) @error
