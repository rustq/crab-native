#ifndef STATICLIB
#define STATICLIB

#ifdef __cplusplus
extern "C" {
#endif

#include <stdint.h>
#include <stddef.h>

void rust_function();

void rust_ffi(void (*say)());

void button_ffi(
    void (*init_button_pool)(void),
    int (*create_button)(void),
    void (*set_button_text)(int id, const char* text),
    void (*add_button_to_view)(int id),
    void (*set_button_x_y_w_h)(int id, int x, int y, int w, int h),
    void (*remove_button)(int id)
);

#ifdef __cplusplus
}
#endif

#endif // STATICLIB
