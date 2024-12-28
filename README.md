# Rust Template

This is a template for a minimal rust project made with [cargo generate](https://github.com/cargo-generate/cargo-generate).

## Installing Dependencies

This template assumes that you have rust and cargo properly installed, if not see [here](https://www.rust-lang.org/tools/install).

This template needs [cargo generate](https://github.com/cargo-generate/cargo-generate). For this you need to run:

`cargo install cargo-generate`

## How to use it

To use this template run

`cargo generate ThePixelCode/Rust-Template`

## Notes

If you select [reqwest](https://crates.io/crates/reqwest) and not select [tokio](https://crates.io/crates/tokio), this template will enable "blocking" feature on reqwest, so if you later decide to use tokio you should consider removing "blocking" feature on reqwest.
