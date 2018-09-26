(module

  ;; extern void func_v();
  (import "env" "func_v" (func $func_v))

  ;; extern void func_vi(int);
  (import "env" "func_vi" (func $func_vi (param i32)))

  ;; extern int func_i();
  (import "env" "func_i" (func $func_i (result i32)))

  ;; int if_else(int x) {
  ;;   if (x < 20)
  ;;     return 5;
  ;;   else
  ;;     return 10;
  ;; }
  (func $if_else (param $x i32) (result i32)
    (select
      (i32.const 5)
      (i32.const 10)
      (i32.lt_s
        (get_local $x)
        (i32.const 20))))

  ;; void while_true() {
  ;;   while (true)
  ;;     func_v();
  ;; }
  (func $while_true
    (loop $L0
      (call $func_v)
      (br $L0)))

  ;; void do_while_loop() {
  ;;   do
  ;;     func_v();
  ;;   while (func_i());
  ;; }
  (func $do_while_loop
    (loop $L0
      (call $func_v)
      (br_if $L0
        (call $func_i))))

  ;; void while_loop() {
  ;;   while(func_i())
  ;;     func_v();
  ;; }
  (func $while_loop
    (block $B0
      (br_if $B0
        (i32.eqz
          (call $func_i)))
      (loop $L1
        (call $func_v)
        (br_if $L1
          (call $func_i)))))

  ;; void for_10() {
  ;;   for (int i = 0; i < 10; i++) {
  ;;     func_vi(i);
  ;;   }
  ;; }
  (func $for_10
    (local $i i32)
    (set_local $i
      (i32.const 0))
    (loop $L0
      (call $func_vi
        (get_local $i))
      (br_if $L0
        (i32.ne
          (tee_local $i
            (i32.add
              (get_local $i)
              (i32.const 1)))
          (i32.const 10)))))

  ;; void for_loop(int x) {
  ;;   for (int i = 0; i < x; i++)
  ;;     func_vi(i);
  ;; }
  (func $for_loop (param $x i32)
    (local $i i32)
    (block $B0
      (br_if $B0
        (i32.lt_s
          (get_local $x)
          (i32.const 1)))
      (set_local $i
        (i32.const 0))
      (loop $L1
        (call $func_vi
          (get_local $i))
        (br_if $L1
          (i32.ne
            (get_local $x)
            (tee_local $i
              (i32.add
                (get_local $i)
                (i32.const 1))))))))
)
