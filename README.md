# webassembly-examples

### installation
```
https://webassembly.org/getting-started/developers-guide/
```

### environment setup after installation
```
source ./emsdk_env.sh --build=Release
```

### example C++ code
```
#include <emscripten.h>

#ifdef __cplusplus
extern "C" {
#endif

int EMSCRIPTEN_KEEPALIVE add(int a, int b) {
  return a + b;
}

#ifdef __cplusplus
}
#endif
```

### compile
```
emcc -O1 main.cpp -o module.js -s WASM=1 -s ONLY_MY_CODE=1
```

### web server
```
python3 -m http.server 8000
```

### load and run WebAssembly code
```
fetch('module.wasm').then(response =>
  response.arrayBuffer()
).then(bytes =>
  WebAssembly.instantiate(bytes/*, importObject*/)
).then(results => {
  console.log(results.instance.exports);
  console.log(results.instance.exports._add(3, 4));
});
```
