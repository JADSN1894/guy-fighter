wit_bindgen::generate!({
    world: "plugin",
    path:  "../wit",
    async: false,
    additional_derives_ignore: ["output", "input"],
});

use crate::tl::guy_fighter::host;
use crate::host::TypeOfGuy;

struct Component;

impl Guest for Component {
    // #[allow(async_fn_in_trait)]
    fn init() -> () { 
         // Create a new guy
        let guy = TypeOfGuy {
            name: "Ferris".into(),
            strength: 100,
            charisma: 100,
            agility: 100,
            battle_cries: vec!["I am the Ferris!".into(), "For Perfomace!".into()],
        };

        // Call the host function
        host::invent_entirely_new_type_of_guy(&guy);
    }

    // #[allow(async_fn_in_trait)]
    fn get_plugin_name() -> _rt::String {
         "Rust Plugin".into()
    }
}

export!(Component);
