# WebAssembly examples

### Resources
- [WebAssembly Docs](https://webassembly.org/docs/high-level-goals/)
- [WebAssembly Github](https://github.com/webassembly)
- [WebAssembly MDN](https://developer.mozilla.org/en-US/docs/WebAssembly)
- [Awesome Wasm](https://github.com/mbasso/awesome-wasm)

### Tools
- [WebAssembly Studio](https://webassembly.studio/)
- [WebAssembly Explorer](https://mbebenita.github.io/WasmExplorer/)
- [Wat2Wasm](https://cdn.rawgit.com/WebAssembly/wabt/aae5a4b7/demo/wat2wasm/)
- [Wasm2Wat](https://cdn.rawgit.com/WebAssembly/wabt/aae5a4b7/demo/wasm2wat/)

### Getting started

Create file *module.wat*
```WebAssembly
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
```

Convert from WebAssembly text format to the WebAssembly binary format
```
wat2wasm module.wat -o module.wasm
```

Run a web server
```
python3 -m http.server 8000
```

Load and run WebAssembly code
```JavaScript
let importObject = {
  env: {
    pow: Math.pow
  }
};

fetch('module.wasm').then(response =>
  response.arrayBuffer()
).then(bytes =>
  WebAssembly.instantiate(bytes, importObject)
).then(results => {
  console.log(results.instance.exports.add(3, 4));
  console.log(results.instance.exports.test(4, 2));
});
```

### Types
- `i32`: 32-bit integer
- `i64`: 64-bit integer
- `f32`: 32-bit floating point
- `f64`: 64-bit floating point

### Functions
All code in WebAssembly is grouped into functions

```cpp
int add(int a, int b) {
  return a + b;
}
```

```WebAssembly
(func $add (param $a i32) (param $b i32) (result i32)
  (i32.add
    (get_local $a)
    (get_local $b)))
```

### if...else statement

There are two ways to express `if`...`else` statement

```WebAssembly
(get_local $condition)
(if
  (then
    ;; statement(s)
  )
  (else
    ;; statement(s)
  )
)
```

```WebAssembly
(if
  (get_local $condition)
  (then
    ;; statement(s)
  )
  (else
    ;; statement(s)
  )
)
```

`if` can also return a result

```WebAssembly
(if (result i32)
  (get_local $condition)
  (then
    i32.const 4)
  (else
    i32.const 5)
)
```

### Blocks of code

- `block`
- `loop`

`br` is control flow instruction

```WebAssembly
(block $B0
  ;; statement(s)
  (br $B0)        (;  ━┓ ;)
  ;; statement(s) (;   ┃ ;)
)                 (;   ┃ ;)
                  (; <━┛ ;)
```

```WebAssembly
(loop $L0         (; <━┓ ;)
  ;; statement(s) (;   ┃ ;)
  (br $L0)        (;  ━┛ ;)
  ;; statement(s)
)
```

`br_if` is `br` with a condition

```cpp
do {
  // statement(s)
} while (condition);
```

```WebAssembly
(loop $L0
  ;; statement(s)
  (br_if $L0
    (get_local $condition))
)
```

Example for loop

```cpp
for (int i = 0; i < 10; i++) {
  // statement(s)
}
```

```WebAssembly
(local $i i32)
(set_local $i
  (i32.const 0))
(loop $L0
  ;; statement(s)
  (br_if $L0
    (i32.ne
      (i32.const 10)
      (tee_local $i
        (i32.add
          (get_local $i)
          (i32.const 1)))))
)
```

### Operators
|   | i32 | i64 | f32 | f64 |
|:-:| --- | --- | --- | --- |
| + | `add` | `add` | `add` | `add` |
| - | `sub` | `sub` | `sub` | `sub` |
| * | `mul` | `mul` | `mul` | `mul` |
| / | `div_s` | `div_s` | `div` | `div` |
| % | `rem_s`| `rem_s` | | |
| == | `eq` | `eq` | `eq` | `eq` |
| != | `ne` | `ne` | `ne` | `ne` |
| < | `lt_s` | `lt_s` | `lt` | `lt` |
| <= | `le_s` | `le_s` | `le` | `le` |
| > | `gt_s` | `gt_s` | `gt` | `gt` |
| >= | `ge_s` | `ge_s` | `ge` | `ge` |
