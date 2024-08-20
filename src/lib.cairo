#[derive(Drop, Copy, PartialEq)]
pub enum KronError {
    UnequalLength,
}

pub fn kron<T, +Mul<T>, +Copy<T>, +Drop<T>,>(
    mut xs: Span<T>, mut ys: Span<T>
) -> Result<Array<T>, KronError> {
    if xs.len() != ys.len() {
        return Result::Err(KronError::UnequalLength);
    }
    let mut array = array![];
    for x_value in xs {
        // let ys_clone = ys;
        for y_value in ys {
            array.append(*x_value * *y_value);
        }
    };
    Result::Ok(array)
}

#[test]
#[available_gas(2000000)]
fn kron_product_test() {
    let xs = array![1_u64, 10, 100];
    let ys = array![5, 6, 7];
    let zs = kron(xs.span(), ys.span()).unwrap();
    assert_eq!(*zs[0], 5);
    assert_eq!(*zs[1], 6);
    assert_eq!(*zs[2], 7);
    assert_eq!(*zs[3], 50);
    assert_eq!(*zs[4], 60);
    assert_eq!(*zs[5], 70);
    assert_eq!(*zs[6], 500);
    assert_eq!(*zs[7], 600);
    assert_eq!(*zs[8], 700);
}

#[test]
#[available_gas(2000000)]
fn kron_product_test_check_len() {
    let xs = array![1_u64];
    let ys = array![];
    assert!(kron(xs.span(), ys.span()) == Result::Err(KronError::UnequalLength));
}