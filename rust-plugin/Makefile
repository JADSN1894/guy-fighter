.PHONY: rust-plugin

rust-plugin: guy-fighter-install/plugins/rust-plugin.wasm

guy-fighter-install/plugins/rust-plugin.wasm: rust-plugin/build/rust-plugin.wasm
	@mkdir -p guy-fighter-install/plugins
	@cp target/wasm32-wasip2/debug/rust_plugin.wasm guy-fighter-install/plugins/rust-plugin.wasm

rust-plugin/build/rust-plugin.wasm:
# 	@mkdir -p rust-plugin/build
	@cargo build --target=wasm32-wasip2 -p rust-plugin
