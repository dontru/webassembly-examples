(module
  (memory $memory 1)

  ;; void triple(int array[], int len) {
  ;;   for (int i = 0; i < len; i++)
  ;;     array[i] *= 3;
  ;; }
  (func $triple (param $array i32) (param $len i32)
    (block $B0
      (br_if $B0
        (i32.lt_s
          (get_local $len)
          (i32.const 1)))
      (loop $L1
        (i32.store
          (get_local $array)
          (i32.mul
            (i32.load
              (get_local $array))
            (i32.const 3)))
        (set_local $array
          (i32.add
            (get_local $array)
            (i32.const 4)))
        (br_if $L1
          (tee_local $len
            (i32.add
              (get_local $len)
              (i32.const -1)))))))

  ;; void strcpy1(char dest[], const char src[]) {
  ;;   int i = 0;
  ;;   while((dest[i] = src[i]))
  ;;     i++;
  ;; }
  (func $strcpy1 (param $dest i32) (param $src i32)
    (local $c i32)
    (loop $L0
      (i32.store8
        (get_local $dest)
        (tee_local $c
          (i32.load8_u
            (get_local $src))))
      (set_local $src
        (i32.add
          (get_local $src)
          (i32.const 1)))
      (set_local $dest
        (i32.add
          (get_local $dest)
          (i32.const 1)))
      (br_if $L0
        (get_local $c))))

  ;; char* strcpy2(char* dest, const char* src) {
  ;;   char* saved = dest;
  ;;   while ((*dest++ = *src++))
  ;;     ;
  ;;   return saved;
  ;; }
  (func $strcpy2 (param $dest i32) (param $src i32) (result i32)
    (local $i i32) (local $c i32)
    (set_local $i
      (i32.const 0))
    (loop $L0
      (i32.store8
        (i32.add
          (get_local $dest)
          (get_local $i))
        (tee_local $c
          (i32.load8_u
            (i32.add
              (get_local $src)
              (get_local $i)))))
      (set_local $i
        (i32.add
          (get_local $i)
          (i32.const 1)))
      (br_if $L0
        (get_local $c)))
    (get_local $dest))
)
