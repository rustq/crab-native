#ifndef STATICLIB
#define STATICLIB

#ifdef __cplusplus
extern "C" {
#endif

#include <stdint.h>
#include <stddef.h>

void rust_function();

void rust_ffi(void (*say)());

#ifdef __cplusplus
}
#endif

#endif // STATICLIB
