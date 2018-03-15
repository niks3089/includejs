cmake_minimum_required(VERSION 3.1.0)

add_definitions(-DINCLUDEOS)
if ("${ARCH}" STREQUAL "i686")
    add_definitions(-DV8_TARGET_ARCH_IA32)
else()
    add_definitions(-DV8_TARGET_ARCH_X64)
endif()

set(UV_TOP ${INCLUDEOS_ROOT}/lib/libuv)
set(UV_SRC ${INCLUDEOS_ROOT}/lib/libuv/src)

include_directories(${UV_TOP}/include)
include_directories(${UV_SRC})
include_directories(${INCLUDEOS_ROOT}/api/posix)
include_directories(${INCLUDEOS_ROOT}/api/kernel)
include_directories(${MUSL_INCLUDE_DIR})
include_directories(${LIBCXX_INCLUDE_DIR})

set(UV_SOURCES
    ${UV_SRC}/fs-poll.c
    ${UV_SRC}/inet.c
    ${UV_SRC}/threadpool.c
    ${UV_SRC}/uv-common.c
    ${UV_SRC}/uv-data-getter-setters.c
    ${UV_SRC}/version.c
    ${UV_SRC}/unix/includeos.c)

add_library(uv STATIC ${UV_SOURCES})
target_compile_definitions(uv PRIVATE HAVE_PTHREAD=0)

# Make sure precompiled libraries exists
add_dependencies(uv PrecompiledLibraries)

# Install library
install(TARGETS uv DESTINATION includeos/${ARCH}/lib)

# Install headers
install(DIRECTORY ${UV_SRC}/include
  DESTINATION includeos/include
  FILES_MATCHING PATTERN "*.h")
