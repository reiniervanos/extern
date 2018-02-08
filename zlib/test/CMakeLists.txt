cmake_minimum_required(VERSION 3.4)
project(zlib_test LANGUAGES CXX)

option(EXTERN_INSTALL "External libraries location" "")
message(STATUS "Externals located at ${EXTERN_INSTALL}")

if(NOT DEFINED CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Release CACHE STRING "Build type")
endif()

if(MSVC)
    add_definitions(-D_CRT_SECURE_NO_WARNINGS)
    add_definitions(-D_CRT_SECURE_NO_DEPRECATE)
    add_definitions(-D_CRT_NONSTDC_NO_DEPRECATE)
endif()

find_package(ZLIB NAMES zlib HINTS ${EXTERN_INSTALL} REQUIRED)


include_directories(${ZLIB_INCLUDE_DIR})
link_directories(${ZLIB_LIBRARY_DIR})
link_libraries(${ZLIB_LIBRARIES})


add_executable(zlib_test test.cc)
