gen-plugin:
	wkg wit build --wit-dir wit --output guy-fighter-install/plugins/go-plugin.wasm
	wit-bindgen-go --force-wit=true generate wit --world plugin --out go_modules/generated 
	tinygo build -target=wasip2 --wit-package guy-fighter-install/plugins/go-plugin.wasm --wit-world plugin -o plugin-name-go.wasm plugin.go
	