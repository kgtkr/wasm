const fs = require("fs");
const child_process = require('child_process');

const name = process.argv[2];
child_process.execSync(`wat2wasm ${name}.wat`);
const buf = fs.readFileSync(`${name}.wasm`);
const memory = new WebAssembly.Memory({ initial: 1 })
const mod = new WebAssembly.Module(buf);
const inst = new WebAssembly.Instance(mod, {
  func: {
    println: function (value) {
      console.log(value);
    },
    printlnString: function (offset, length) {
      const bytes = new Uint8Array(memory.buffer, offset, length);
      const string = new TextDecoder('utf8').decode(bytes);
      console.log(string);
    },
  },
  js: {
    mem: memory
  }
});
inst.exports.main();