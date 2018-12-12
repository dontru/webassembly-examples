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
