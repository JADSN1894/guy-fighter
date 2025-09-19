.PHONY: all run

all: guy-fighter c-plugin js-plugin rust-plugin

guy-fighter-install/bin/guy-fighter: guy-fighter/src/main.rs guy-fighter/src/game.rs guy-fighter/src/names.rs guy-fighter/src/visualization.rs wit/guy-fighter.wit
	@mkdir -p guy-fighter-install
	cd guy-fighter && cargo build && cargo install --path . --root ../guy-fighter-install

guy-fighter: guy-fighter-install/bin/guy-fighter

run: all
	rm -rfv ./wit/deps ./deps/deps.lock
	wit-deps
	guy-fighter-install/bin/guy-fighter --plugins guy-fighter-install/plugins

include c-plugin/Makefile
include js-plugin/Makefile
include rust-plugin/Makefile
include go-plugin/Makefile