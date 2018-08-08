(module

  ;; ARITHMETIC

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


  ;; COMPARISON

  ;; bool compareEqual(int a, int b) {
  ;;   return a == b;
  ;; }
  (func $compareEqual (param $a i32) (param $b i32) (result i32)
    (i32.eq
      (get_local $a)
      (get_local $b)))

  ;; bool compareUnequal(int a, int b) {
  ;;   return a != b;
  ;; }
  (func $compareUnequal (param $a i32) (param $b i32) (result i32)
    (i32.ne
      (get_local $a)
      (get_local $b)))

  ;; bool lessThan(int a, int b) {
  ;;   return a < b;
  ;; }
  (func $lessThan (param $a i32) (param $b i32) (result i32)
    (i32.lt_s
      (get_local $a)
      (get_local $b)))

  ;; bool lessThanOrEqual(int a, int b) {
  ;;   return a <= b;
  ;; }
  (func $lessThanOrEqual (param $a i32) (param $b i32) (result i32)
    (i32.le_s
      (get_local $a)
      (get_local $b)))

  ;; bool greaterThan(int a, int b) {
  ;;   return a > b;
  ;; }
  (func $greaterThan (param $a i32) (param $b i32) (result i32)
    (i32.gt_s
      (get_local $a)
      (get_local $b)))

  ;; bool greaterThanOrEqual(int a, int b) {
  ;;   return a >= b;
  ;; }
  (func $greaterThanOrEqual (param $a i32) (param $b i32) (result i32)
    (i32.ge_s
      (get_local $a)
      (get_local $b)))

  ;; bool compareEqualToZero(int a) {
  ;;   return a == 0;
  ;; }
  (func $compareEqualToZero (param $a i32) (result i32)
    (i32.eqz
      (get_local $a)))


  ;; BITWISE

  ;; int bitwiseAnd(int a, int b) {
  ;;   return a & b;
  ;; }
  (func $bitwiseAnd (param $a i32) (param $b i32) (result i32)
    (i32.and
      (get_local $a)
      (get_local $b)))

  ;; int bitwiseInclusiveOr(int a, int b) {
  ;;   return a | b;
  ;; }
  (func $bitwiseInclusiveOr (param $a i32) (param $b i32) (result i32)
    (i32.or
      (get_local $a)
      (get_local $b)))

  ;; int bitwiseExclusiveOr(int a, int b) {
  ;;   return a ^ b;
  ;; }
  (func $bitwiseExclusiveOr (param $a i32) (param $b i32) (result i32)
    (i32.xor
      (get_local $a)
      (get_local $b)))

  ;; int bitwiseNot(int a) {
  ;;   return ~a;
  ;; }
  (func $bitwiseNot (param $a i32) (result i32)
    (i32.xor
      (get_local $a)
      (i32.const -1)))

  ;; int shiftLeft(int a, int b) {
  ;;   return a << b;
  ;; }
  (func $shiftLeft (param $a i32) (param $b i32) (result i32)
    (i32.shl
      (get_local $a)
      (get_local $b)))

  ;; int shiftRight(int a, int b) {
  ;;   return a >> b;
  ;; }
  (func $shiftRight (param $a i32) (param $b i32) (result i32)
    (i32.shr_s
      (get_local $a)
      (get_local $b)))


  ;; TERNARY

  ;; int ternaryOperator(bool a) {
  ;;   return a ? 3 : 4;
  ;; }
  (func $ternaryOperator (param $a i32) (result i32)
    (select
      (i32.const 3)
      (i32.const 4)
      (get_local $a)))
)
