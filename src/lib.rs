use std::thread;
use std::time;

pub fn add(left: u64, right: u64) -> u64 {
    left + right
}

#[no_mangle]
pub extern "C" fn rust_function() {
    println!("Hello from Rust!");
}

#[no_mangle]
pub extern "C" fn rust_ffi(add_ui: extern "C" fn(tp: i32, x: i32, y: i32, width: i32, height: i32)) {
    println!("Hello from FFI! hey!");
    thread::spawn(move || {
        thread::sleep(time::Duration::from_secs(1));
        add_ui(0, 100, 100, 100, 100);
        thread::sleep(time::Duration::from_secs(1));
        add_ui(1, 100, 200, 100, 100);
        thread::sleep(time::Duration::from_secs(1));
        add_ui(1, 100, 300, 100, 100);
    });
}


#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn it_works() {
        let result = add(2, 2);
        assert_eq!(result, 4);
    }
}
