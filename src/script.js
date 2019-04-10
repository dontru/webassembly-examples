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
