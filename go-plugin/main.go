package main

//go:generate go tool wit-bindgen-go generate --world adder --out internal ./docs:adder@0.1.0.wasm

// package main

import (
	"go-plugin/internal/tl/guy-fighter/host"
	"go-plugin/internal/tl/guy-fighter/plugin"
	"go.bytecodealliance.org/cm"
)

func init() {
    plugin.Exports.Init = func()  { 

        guy := host.TypeOfGuy {
            Name: "Gopher",
            Strength: 42,
            Charisma: 42,
            Agility: 42,
            BattleCries: cm.List[string] {},
        };

        // Call the host function
        host.InventEntirelyNewTypeOfGuy(guy);

    }

    plugin.Exports.GetPluginName = func() string  {
        return "Go Plugin";
     }
}


// main is required for the `wasi` target, even if it isn't used.
func main() {}
