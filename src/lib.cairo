use core::sha256::compute_sha256_u32_array;

#[test]
fn test_sha256() {
    let mut input: Array::<u32> = Default::default();
    input.append('aaaa');

    // Test the sha256 syscall computation of the string 'aaaa'.
    let [res, _, _, _, _, _, _, _,] = compute_sha256_u32_array(input, 0, 0);
    assert(res == 0x61be55a8, 'Wrong hash value');
}