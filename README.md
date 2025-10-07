<pre>
╔══════════════════════════════════════════════════════════════════════════════════════╗
║                                                                                      ║
║  ██████╗ ██╗   ██╗██╗   ██╗    ███████╗██╗ ██████╗ ██╗  ██╗████████╗███████╗██████╗  ║
║ ██╔════╝ ██║   ██║╚██╗ ██╔╝    ██╔════╝██║██╔════╝ ██║  ██║╚══██╔══╝██╔════╝██╔══██╗ ║
║ ██║  ███╗██║   ██║ ╚████╔╝     █████╗  ██║██║  ███╗███████║   ██║   █████╗  ██████╔╝ ║
║ ██║   ██║██║   ██║  ╚██╔╝      ██╔══╝  ██║██║   ██║██╔══██║   ██║   ██╔══╝  ██╔══██╗ ║
║ ╚██████╔╝╚██████╔╝   ██║       ██║     ██║╚██████╔╝██║  ██║   ██║   ███████╗██║  ██║ ║
║  ╚═════╝  ╚═════╝    ╚═╝       ╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚══════╝╚═╝  ╚═╝ ║
║                                                                                      ║
║                                                                                      ║ 
║                                                                                      ║
║                                🥊 ULTIMATE EDITION 🥊                               ║
╚══════════════════════════════════════════════════════════════════════════════════════╝
</pre>

A demonstration of a plugin system using [WASM Components](https://component-model.bytecodealliance.org/).

Guy Fighter is a console application that lets you simulate fights between different types of guys. Plugins can be written and loaded into Guy Fighter to invent entirely new types of guys to fight.

## Articles
- [WebAssembly Components: Circular Dependencies and World Elaboration](https://tartanllama.xyz/posts/wasm-circular-dependencies/)
- [Building Native Plugin Systems with WebAssembly Components](https://tartanlmakelama.xyz/posts/wasm-plugins/)

## Overview

Guy Fighter consists of four components:

- A [host console application](https://github.com/TartanLlama/guy-fighter/tree/main/guy-fighter), written in Rust
- A [Deluxe Dog plugin](https://github.com/TartanLlama/guy-fighter/tree/main/c-plugin), written in C
- A [Coffee Guy plugin](https://github.com/TartanLlama/guy-fighter/tree/main/js-plugin), written in JavaScript
- An [interface definition file](https://github.com/TartanLlama/guy-fighter/blob/main/guy-fighter/wit/guy-fighter.wit) that defines the communication between these components, written in [WIT](https://component-model.bytecodealliance.org/design/wit.html)

The host application embeds the [Wasmtime](https://github.com/bytecodealliance/wasmtime) WASM runtime. The plugins are compiled to WASM components and run inside the WASM sandbox, communicating with the host through a limited interface defined in the WIT file.

## Dependencies

- [wasi-sdk](https://github.com/WebAssembly/wasi-sdk) for building the C plugin
- [NodeJS](https://nodejs.org/en/download) for building the JS plugin
- [ComponentizeJS](https://github.com/bytecodealliance/ComponentizeJS) for building the JS plugin
- [Rust](https://www.rust-lang.org/tools/install) for building host application

## Running

```bash
$ make run
```

This builds the host application, C and JS plugins, and runs Guy Fighter.


## Issues

### Go

1. [**Go Component WIT World Limitations - TinyGo Hardcoded to wasi:cli/command**](https://github.com/pulseengine/rules_wasm_component/issues/80)
1. [**Allow compiling Wasm components with worlds besides wasi:cli/command**](https://github.com/tinygo-org/tinygo/issues/4843)
1. [**Allow implementing different WIT worlds in wasip2 target**](https://github.com/tinygo-org/tinygo/pull/4934)


### Zig

1. [**doink**](https://github.com/macovedj/doink/tree/main)
1. [**WebAssembly with Zig, Part 1**](https://dev.to/sleibrock/webassembly-with-zig-part-1-4onm)
