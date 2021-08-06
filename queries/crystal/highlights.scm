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

(type) @type

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

(method_definition name: [
               (identifier) @function
               (type) @type
               ])

(singleton_method name: [
                         (identifier) @function
                         (type) @type
                         ])

(class_definition name: (type) @type)
(module_definition name: (constant) @type)
(class_definition name: (type) @type)
(class_definition superclass: (type) @type)

; Identifiers
[
 (class_variable)
 (instance_variable)
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

(regex) @string.regex
(string_escape_sequence) @string.escape
(char_escape_sequence) @string.escape
(integer) @number
(float) @float

[
 (nil)
 (bool)
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
