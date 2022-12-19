cmake_minimum_required(VERSION 3.18.1)

set(CMAKE_CROSSCOMPILING ON)

if(NOT DEFINED TARGET_ARCH)
    if(EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/env.cmake)
        include(${CMAKE_CURRENT_SOURCE_DIR}/env.cmake)
    endif()
endif()

if(NOT DEFINED TARGET_ARCH)
    message(FATAL_ERROR "$TARGET_ARCH is not defined")
endif()

if(NOT DEFINED TARGET_API)
    message(FATAL_ERROR "$TARGET_API is not defined")
endif()

if(NOT DEFINED NDK_PATH)
    if(NOT DEFINED ENV{NDK_PATH})
        message(FATAL_ERROR "$NDK_PATH is not defined")
    else()
        set(NDK_PATH $ENV{NDK_PATH})
        message("use NDK_PATH from env")
    endif()
endif()

set(CMAKE_SYSTEM_NAME Android)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_SYSTEM_VERSION ${TARGET_API})
set(ANDROID_PLATFORM android-${TARGET_API})
set(ANDROID_ABI ${TARGET_ARCH})
set(CMAKE_ANDROID_ARCH_ABI ${TARGET_ARCH})
set(ANDROID_NDK ${NDK_PATH})
set(CMAKE_ANDROID_NDK ${NDK_PATH})
set(CMAKE_TOOLCHAIN_FILE ${NDK_PATH}/build/cmake/android.toolchain.cmake)
set(ANDROID_SDK_ROOT ${NDK_PATH})
set(CMAKE_FIND_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})


if(${ANDROID_ABI} STREQUAL "armeabi-v7a")
    message("Build target abi: ${ANDROID_ABI}")
elseif(${ANDROID_ABI} STREQUAL "arm64-v8a")
    message("Build target abi: ${ANDROID_ABI}")
elseif(${ANDROID_ABI} STREQUAL "x86")
    message("Build target abi: ${ANDROID_ABI}")
elseif(${ANDROID_ABI} STREQUAL "x86_64")
    message("Build target abi: ${ANDROID_ABI}")
else()
    message(FATAL_ERROR "Unsupported Android Arch")
endif()

project(ndk-vscode)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/out/${TARGET_ARCH})
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/out/${TARGET_ARCH})
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/out/${TARGET_ARCH})

##########################################

add_subdirectory(demo)