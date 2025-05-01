pub struct W<T>(pub T);

pub trait Wrap {
    fn wrap(self) -> W<Self>;
    fn unwrap(value: W<Self>) -> Self;
}

impl<T: Sized> Wrap for T {
    fn wrap(self) -> W<Self> {
        W(self)
    }

    fn unwrap(value: W<Self>) -> Self {
        value.0
    }
}

impl<T> std::ops::Deref for T {
    type Target = T;
    fn deref(&self) -> &Self::Target {
        &self.0
    }
}

impl<T: Debug> Debug for W<T> {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        self.0.fmt(f)
    }
}
