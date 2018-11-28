(module
  (memory $memory 1)

  ;; int si() {
  ;;   static int x;
  ;;   return ++x;
  ;; }
  (func $si (result i32)
    (local $x i32)
    (i32.store offset=12
      (i32.const 0)
      (tee_local $x
        (i32.add
          (i32.load offset=12
            (i32.const 0))
          (i32.const 1))))
    (get_local $x))

  ;; int factorial(int n) {
  ;;   if (n == 0)
  ;;     return 1;
  ;;   else
  ;;     return n * factorial(n - 1);
  ;; }
  (func $factorial (param $n i32) (result i32)
    (local $l0 i32) (local $l1 i32)
    (block $B0
      (br_if $B0
        (i32.eqz
          (get_local $n)))
      (set_local $l1
        (i32.const 1))
      (loop $L1
        (set_local $l1
          (i32.mul
            (get_local $n)
            (get_local $l1)))
        (set_local $n
          (tee_local $l0
            (i32.add
              (get_local $n)
              (i32.const -1))))
        (br_if $L1
          (get_local $l0)))
      (return
        (get_local $l1)))
    (i32.const 1))
)
