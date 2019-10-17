#[no_mangle]
pub extern fn fib(n: i32) -> i32 {
    if n <= 1 {
        n
    } else {
        fib(n - 2) + fib(n - 1)
    }
}
