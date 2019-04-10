(module
  ;; calling JavaScript from WebAssembly
  (import "env" "pow" (func $pow (param f64 f64) (result f64)))

  ;; calling WebAssembly from JavaScript
  (func (export "add") (param f64 f64) (result f64)
    (f64.add
      (get_local 0)
      (get_local 1)))

  ;; test imported $pow
  (func (export "test") (param f64 f64) (result f64)
    (call $pow
      (get_local 0)
      (get_local 1)))
)
