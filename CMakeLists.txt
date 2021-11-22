cmake_minimum_required(VERSION 3.13)
include(pico_sdk_import.cmake)
project(examples LANGUAGES C CXX ASM)


set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
pico_sdk_init()

add_executable(examples main.cpp math.S)

pico_enable_stdio_usb(examples 1)
pico_enable_stdio_uart(examples 1)
pico_add_extra_outputs(examples)

target_link_libraries(examples pico_stdlib)
