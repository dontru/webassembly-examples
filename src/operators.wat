(module

  ;; int add(int a, int b) {
  ;;   return a + b;
  ;; }
  (func $add (param $a i32) (param $b i32) (result i32)
    (i32.add
      (get_local $a)
      (get_local $b)))

  ;; int subtract(int a, int b) {
  ;;   return a - b;
  ;; }
  (func $subtract (param $a i32) (param $b i32) (result i32)
    (i32.sub
      (get_local $a)
      (get_local $b)))

  ;; double multiply(double a, double b) {
  ;;   return a * b;
  ;; }
  (func $multiply (param $a f64) (param $b f64) (result f64)
    (f64.mul
      (get_local $a)
      (get_local $b)))

  ;; double divide(double a, double b) {
  ;;   return a / b;
  ;; }
  (func $divide (param $a f64) (param $b f64) (result f64)
    (f64.div
      (get_local $a)
      (get_local $b)))

  ;; int modulo(int a, int b) {
  ;;   return a % b;
  ;; }
  (func $modulo (param $a i32) (param $b i32) (result i32)
    (i32.rem_s
      (get_local $a)
      (get_local $b)))
)
