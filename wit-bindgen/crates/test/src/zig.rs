use crate::{Compile, Kind, LanguageMethods, Runner, Verify};
use anyhow::{Context, Result};
use clap::Parser;

pub struct Zig;

#[derive(Default, Debug, Clone, Parser)]
pub struct ZigOpts {}

impl LanguageMethods for Zig {
    fn display(&self) -> &str {
        "zig"
    }

    fn comment_prefix_for_test_config(&self) -> Option<&str> {
        todo!()
    }

    fn prepare(&self, runner: &mut Runner<'_>) -> Result<()> { 
        todo!()
    }

    fn compile(&self, runner: &Runner<'_>, compile: &Compile) -> Result<()> {
        todo!()
    }

    fn should_fail_verify(
        &self,
        name: &str,
        config: &crate::config::WitConfig,
        args: &[String],
    ) -> bool {
        todo!()
    }

    fn verify(&self, runner: &Runner<'_>, verify: &Verify) -> Result<()> {
        todo!()
    }
}
