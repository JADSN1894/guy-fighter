gen-plugin:
	wkg wit build --wit-dir wit --output guy-fighter-install/plugins/go-plugin.wasm
	go tool wit-bindgen-go generate --world plugin --out internal go-plugin/generated