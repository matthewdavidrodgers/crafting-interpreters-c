#ifndef clox_common_h
#define clox_common_h

#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>

#define UINT8_COUNT (UINT8_MAX + 1)

#define NAN_BOXING
#define DEBUG_PRINT_CODE
#undef DEBUG_TRACE_EXECUTION
#define DEBUG_STRESS_GC
#undef DEBUG_LOG_GC

#endif
