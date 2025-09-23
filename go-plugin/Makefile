.PHONY: go-plugin

tinygo-plugin: 
#  	go get -tool go.bytecodealliance.org/cmd/wit-bindgen-go
# 	go mod tidy
	wkg wit build --wit-dir wit --output bundled.wasm
# 	go mod tidy
# 	wit-bindgen-go --force-wit=true generate wit --world plugin --out internal
	go tool wit-bindgen-go generate --world plugin --out internal bundled.wasm
	tinygo clean
	tinygo build -target=wasip2 -o ../guy-fighter-install/plugins/go-plugin.wasm --wit-package=bundled.wasm --wit-world=plugin main.go
