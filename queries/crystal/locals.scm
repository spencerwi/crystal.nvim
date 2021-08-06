((method_def) @scope
 (set! scope-inherits false))
(class_definition) @scope

[
 (begin_block)
 (rescue_block)
] @scope

(identifier) @reference
(constant) @reference
(instance_variable) @reference

(module_definition name: (constant) @definition.namespace)
(class_definition name: (type) @definition.type)
(method_definition name: (identifier) @definition.function)


(param name: (identifier) @definition.var)

(assignment lhs: (identifier) @definition.var)
(assignment lhs: (instance_variable) @definition.var)
(assignment lhs: (class_variable) @definition.var)
(assignment lhs: (constant) @definition.var)
