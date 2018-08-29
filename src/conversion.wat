(module

  ;; i32

  (func $i64_to_i32 (param i64) (result i32)
    (i32.wrap/i64
      (get_local 0)))

  (func $f32_to_i32 (param f32) (result i32)
    (i32.trunc_s/f32
      (get_local 0)))

  (func $f64_to_i32 (param f64) (result i32)
    (i32.trunc_s/f64
      (get_local 0)))


  ;; i64

  (func $i32_to_i64 (param i32) (result i64)
    (i64.extend_s/i32
      (get_local 0)))

  (func $f32_to_i64 (param f32) (result i64)
    (i64.trunc_s/f32
      (get_local 0)))

  (func $f64_to_i64 (param f64) (result i64)
    (i64.trunc_s/f64
      (get_local 0)))


  ;; f32

  (func $i32_to_f32 (param i32) (result f32)
    (f32.convert_s/i32
      (get_local 0)))

  (func $i64_to_f32 (param i64) (result f32)
    (f32.convert_s/i64
      (get_local 0)))

  (func $f64_to_f32 (param f64) (result f32)
    (f32.demote/f64
      (get_local 0)))


  ;; f64

  (func $i32_to_f64 (param i32) (result f64)
    (f64.convert_s/i32
      (get_local 0)))

  (func $i64_to_f64 (param i64) (result f64)
    (f64.convert_s/i64
      (get_local 0)))

  (func $f32_to_f64 (param f32) (result f64)
    (f64.promote/f32
      (get_local 0)))


  ;; bool, i8, i16

  (func $i32_to_bool (param i32) (result i32)
    (i32.ne
      (get_local 0)
      (i32.const 0)))

  (func $i32_to_i8 (param i32) (result i32)
    (i32.shr_s
      (i32.shl
        (get_local 0)
        (i32.const 24))
      (i32.const 24)))

  (func $i32_to_i16 (param i32) (result i32)
    (i32.shr_s
      (i32.shl
        (get_local 0)
        (i32.const 16))
      (i32.const 16)))
)
