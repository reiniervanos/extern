cmake_minimum_required(VERSION 3.4)
project(stb_test LANGUAGES CXX)

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

find_package(STB NAMES stb HINTS ${EXTERN_INSTALL} REQUIRED)


include_directories(${STB_INCLUDE_DIR})
link_directories(${STB_LIBRARY_DIR})
link_libraries(${STB_LIBRARIES})


add_executable(stb_test test.cc)

#target_compile_definitions(stb_test
#    PUBLIC -DSTB_IMAGE_STATIC
#    PUBLIC -DSTB_IMAGE_WRITE_STATIC)

