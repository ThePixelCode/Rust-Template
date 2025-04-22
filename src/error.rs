#[derive(Debug, thiserror::Error)]
pub enum ErrorKind {
    #[error("Generic {0}")]
    GenericError(&'static str),
}

pub type Result<T> = core::result::Result<T, ErrorKind>;
