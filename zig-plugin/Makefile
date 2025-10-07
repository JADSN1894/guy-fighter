.PHONY: zig-plugin

zig-plugin: 
	rm -fv *.wasm

	zig build-exe -O ReleaseSmall -target wasm32-freestanding main.zig -rdynamic
	wasm-tools print --skeleton main.wasm -o main-debug.wasm

	wasm-tools component embed toggler.wit main.wasm -o embed.wasm
	wasm-tools print --skeleton embed.wasm -o embed-debug.wasm

	wasm-tools component new embed.wasm -o component.wasm
	wasm-tools print --skeleton component.wasm -o component-debug.wasm	

	wasm-tools strip -vvv --all component.wasm --output final.wasm
	wasm-tools print --skeleton final.wasm -o final-debug.wasm	

	cp -v wit-bindgen/target/release/wit-bindgen ./
	wit-bindgen zig
