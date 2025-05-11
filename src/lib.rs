use std::process::id;
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

#[no_mangle]
pub extern "C" fn button_ffi(init_button_pool: extern "C" fn(), create_button: extern "C" fn() -> i32, set_button_text: extern "C" fn(id: i32, text: *const std::os::raw::c_char), add_button_to_view: extern "C" fn(id: i32), set_button_x_y_w_h: extern "C" fn(id: i32, x: i32, y: i32, w: i32, h: i32), remove_button: extern "C" fn(id: i32)) {
    println!("This is Button FFI! alright?");
    init_button_pool();
    thread::spawn(move || {
        thread::sleep(time::Duration::from_secs(1));
        let id_btn_0 = create_button();
        thread::sleep(time::Duration::from_secs(1));
        set_button_text(id_btn_0, std::ffi::CString::new("你是人?").unwrap().as_ptr());
        thread::sleep(time::Duration::from_secs(1));
        set_button_x_y_w_h(id_btn_0, 100, 100, 100, 100);
        thread::sleep(time::Duration::from_secs(1));
        add_button_to_view(id_btn_0);

        thread::sleep(time::Duration::from_secs(1));
        let id_btn_1 = create_button();
        thread::sleep(time::Duration::from_secs(1));
        set_button_text(id_btn_1, std::ffi::CString::new("🤔?").unwrap().as_ptr());
        thread::sleep(time::Duration::from_secs(1));
        set_button_x_y_w_h(id_btn_1, 200, 200, 100, 100);
        thread::sleep(time::Duration::from_secs(1));
        add_button_to_view(id_btn_1);
        // thread::sleep(time::Duration::from_secs(1));
        // set_button_x_y_w_h(id_btn_0, 200, 200, 100, 100);
        // thread::sleep(time::Duration::from_secs(1));
        // set_button_x_y_w_h(id_btn_0, 300, 100, 100, 100);
        // thread::sleep(time::Duration::from_secs(1));
        // remove_button(id_btn_0);
        // thread::sleep(time::Duration::from_secs(1));
        // remove_button(id_btn_1);
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
