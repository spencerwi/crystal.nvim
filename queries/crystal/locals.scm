((method_def) @scope
 (set! scope-inherits false))
(class_def) @scope

[
 (begin_block)
 (rescue_block)
] @scope

(identifier) @reference
(constant) @reference
(instance_var) @reference

(module_def name: (constant) @definition.namespace)
(class_def name: (constant) @definition.type)
(method_def name: (identifier) @definition.function)


(param name: (identifier) @definition.var)

(assign lhs: (identifier) @definition.var)
(assign lhs: (instance_var) @definition.var)
(assign lhs: (class_var) @definition.var)
(const_assign lhs: (constant) @definition.var)
