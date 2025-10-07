use anyhow::{bail, Result};
use wit_bindgen_core::{
    dealias, name_package_module, uwrite, uwriteln, wit_parser::*, AsyncFilterSet, Files,
    InterfaceGenerator as _, Source, Types, WorldGenerator,
};

#[derive(Default, Debug, Clone)]
#[cfg_attr(feature = "clap", derive(clap::Parser))]
pub struct Opts {}

#[derive(Default)]
struct ZigWasm {}

impl ZigWasm {
    fn new() -> Self {
        Self::default()
    }
}

impl WorldGenerator for ZigWasm {
    fn import_interface(
        &mut self,
        resolve: &Resolve,
        name: &WorldKey,
        id: InterfaceId,
        _files: &mut Files,
    ) -> Result<()> {
        todo!()
    }

    fn export_interface(
        &mut self,
        resolve: &Resolve,
        name: &WorldKey,
        iface: InterfaceId,
        files: &mut Files,
    ) -> Result<()> {
        todo!()
    }

    fn import_funcs(
        &mut self,
        resolve: &Resolve,
        world: WorldId,
        funcs: &[(&str, &Function)],
        files: &mut Files,
    ) {
        todo!()
    }

    fn export_funcs(
        &mut self,
        resolve: &Resolve,
        world: WorldId,
        funcs: &[(&str, &Function)],
        files: &mut Files,
    ) -> Result<()> {
        dbg!(resolve);
        dbg!(world);
        dbg!(funcs);
        dbg!(files.iter().collect::<Vec<_>>());
        Ok(())
    }

    fn import_types(
        &mut self,
        resolve: &Resolve,
        world: WorldId,
        types: &[(&str, TypeId)],
        files: &mut Files,
    ) {
        todo!()
    }

    fn finish(&mut self, resolve: &Resolve, world: WorldId, files: &mut Files) -> Result<()> {
        Ok(())
    }
}

impl Opts {
    pub fn build(self) -> Box<dyn WorldGenerator> {
        let zig_wasm = ZigWasm::new();

        Box::new(zig_wasm)
    }
}
