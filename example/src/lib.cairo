trait NameTrait<T> {
    fn name(self: @T) -> ByteArray;
}

#[dojo_model]
#[derive(Drop)]
struct MyStruct {
    x: u8,
    y: u16,
    z: u32,
}

#[derive(Drop, Introspect)]
struct MyOtherStruct {
    x: u8,
    y: u8,
}


fn main() {
    let hash: felt252 = bytearray_hash!("hello world");
}

#[cfg(test)]
mod tesciki {
    #[test]
    fn tescikxd() {
        assert(1 == 1, 'wdupiles');
    }
}
