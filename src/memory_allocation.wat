(module
  (import "env" "_Znwj" (func $_Znwj (param i32) (result i32))) ;; new
  (import "env" "_Znaj" (func $_Znaj (param i32) (result i32))) ;; new[]
  (import "env" "_ZdlPv" (func $_ZdlPv (param i32))) ;; delete
  (import "env" "_ZdaPv" (func $_ZdaPv (param i32))) ;; delete[]

  (memory $memory 1)

  ;; int load(int* a) {
  ;;   return *a;
  ;; }
  (func $load (param $a i32) (result i32)
    (i32.load
      (get_local $a)))

  ;; void store(int* a, int b) {
  ;;   *a = b;
  ;; }
  (func $store (param $a i32) (param $b i32)
    (i32.store
      (get_local $a)
      (get_local $b)))

  ;; int* func1() {
  ;;   int* ptr = new int;
  ;;   return ptr;
  ;; }
  (func $func1 (result i32)
    (call $_Znwj
      (i32.const 4)))

  ;; void func2(int* ptr) {
  ;;   delete ptr;
  ;; }
  (func $func2 (param $ptr i32)
    (block $B0
      (br_if $B0
        (i32.eqz
          (get_local $ptr)))
      (call $_ZdlPv
        (get_local $ptr))))

  ;; int* func3() {
  ;;   int* ptr = new int[10];
  ;;   return ptr;
  ;; }
  (func $func3 (result i32)
    (call $_Znaj
      (i32.const 40)))

  ;; void func4(int* ptr) {
  ;;   delete[] ptr;
  ;; }
  (func $func4 (param $ptr i32)
    (block $B0
      (br_if $B0
        (i32.eqz
          (get_local $ptr)))
      (call $_ZdaPv
        (get_local $ptr))))

  ;; int* func5(int size) {
  ;;   int* ptr = new int[size];
  ;;   return ptr;
  ;; }
  (func $func5 (param $size i32) (result i32)
    (local $l0 i64)
    (call $_Znaj
      (select
        (i32.const -1)
        (i32.wrap/i64
          (tee_local $l0
            (i64.shl
              (i64.extend_u/i32
                (get_local $size))
              (i64.const 2))))
        (i32.wrap/i64
          (i64.shr_u
            (get_local $l0)
            (i64.const 32))))))
)
