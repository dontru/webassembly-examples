(module

  ;; #include <math.h>
  ;;
  ;; double distance(double x1, double y1, double x2, double y2) {
  ;;   double a = x1 - x2;
  ;;   double b = y1 - y2;
  ;;   return sqrt(pow(a, 2) + pow(b, 2));
  ;; }
  (func $distance (param $x1 f64) (param $y1 f64) (param $x2 f64) (param $y2 f64) (result f64)
    (f64.sqrt
      (f64.add
        (f64.mul
          (tee_local $x1
            (f64.sub
              (get_local $x1)
              (get_local $x2)))
          (get_local $x1))
        (f64.mul
          (tee_local $x1
            (f64.sub
              (get_local $y1)
              (get_local $y2)))
          (get_local $x1)))))


  ;; in a different way
  (func $distance2 (param $x1 f64) (param $y1 f64) (param $x2 f64) (param $y2 f64) (result f64)
    (f64.sqrt
      (f64.add
        (call $square
          (f64.sub
            (get_local $x1)
            (get_local $x2)))
        (call $square
          (f64.sub
            (get_local $y1)
            (get_local $y2))))))

  (func $square (param $a f64) (result f64)
    (f64.mul
      (get_local $a)
      (get_local $a)))
)
