/*
 */

#include "uv.h"
#include "internal.h"

int uv__platform_loop_init(uv_loop_t* loop) {
    return 0;
}

void uv__platform_loop_delete(uv_loop_t* loop) {
}

void uv_loadavg(double avg[3]) {
}

int uv_exepath(char* buffer, size_t* size) {
}

uint64_t uv_get_free_memory(void) {
    return 0;
}

uint64_t uv_get_total_memory(void) {
    return 0;
}

char** uv_setup_args(int argc, char** argv) {
    return NULL;
}

int uv_set_process_title(const char* title) {
    return 0;
}

int uv_get_process_title(char* buffer, size_t size) {
    return 0;
}

int uv_resident_set_memory(size_t* rss) {
    return 0;
}

int uv_uptime(double* uptime) {
    return 0;
}

int uv_cpu_info(uv_cpu_info_t** cpu_infos, int* count) {
    return 0;
}

void uv_free_cpu_info(uv_cpu_info_t* cpu_infos, int count) {
}
