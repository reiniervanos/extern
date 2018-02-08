cmake_minimum_required(VERSION 3.4)
project(shaderc VERSION 1.0 LANGUAGES CXX)

find_package(SPIRV NAMES spirv REQUIRED)
find_package(GLSLANG NAMES glslang REQUIRED)

set(SHADERC_MAJOR_VERSION 1)
set(SHADERC_MINOR_VERSION 0)
set(INSTALL_CONFIG_DIR  ${CMAKE_INSTALL_PREFIX}/lib/cmake/shaderc)
set(INSTALL_INCLUDE_DIR ${CMAKE_INSTALL_PREFIX}/include/shaderc)
set(INSTALL_LIBRARY_DIR ${CMAKE_INSTALL_PREFIX}/lib)
set(INSTALL_ARCHIVE_DIR ${CMAKE_INSTALL_PREFIX}/lib)
set(INSTALL_RUNTIME_DIR ${CMAKE_INSTALL_PREFIX}/bin)

if("${CMAKE_SYSTEM_NAME}" STREQUAL "Android")
    set(ANDROID true)
endif()

if(NOT DEFINED CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Release CACHE STRING "Build type")
endif()
set(CMAKE_DEBUG_POSTFIX "d" CACHE STRING "Set debug library postfix")
set(CMAKE_CONFIGURATION_TYPES Debug Release CACHE TYPE INTERNAL FORCE)

if(MSVC)
    add_definitions(-D_CRT_SECURE_NO_WARNINGS)
    add_definitions(-D_CRT_SECURE_NO_DEPRECATE)
    add_definitions(-D_CRT_NONSTDC_NO_DEPRECATE)
    add_compile_options(/wd4800)
else()
    #add_compile_options(-Wall -Wextra -Wnon-virtual-dtor -Wno-missing-field-initializers)
endif()

include(cmake/shadercLibrary.cmake)
add_library(shaderc STATIC 
    ${HEADERS_PUBLIC}
    ${HEADERS_PRIVATE}
    ${SOURCES_PRIVATE})

target_include_directories(shaderc
    PRIVATE ${SPIRV_INCLUDE_DIR}
	PRIVATE ${GLSLANG_INCLUDE_DIR}
	PRIVATE ${GLSLANG_INCLUDE_DIR}/glslang
	PRIVATE ${GLSLANG_INCLUDE_DIR}/glslang/SPIRV
    PRIVATE ${CMAKE_SOURCE_DIR}/project/shaderc/libshaderc/include
	PRIVATE ${CMAKE_SOURCE_DIR}/project/shaderc/libshaderc_util/include	
    PRIVATE ${CMAKE_SOURCE_DIR}/project/shaderc/source)

target_compile_features(shaderc
    PRIVATE cxx_std_11)

if(CMAKE_BUILD_TYPE MATCHES Release)
    target_compile_definitions(shaderc PRIVATE -DNDEBUG)
endif()

include(CMakePackageConfigHelpers)
configure_package_config_file(
    cmake/shadercConfig.cmake.in
    ${CMAKE_BINARY_DIR}/shadercConfig.cmake
    INSTALL_DESTINATION ${INSTALL_CONFIG_DIR}
    PATH_VARS INSTALL_LIBRARY_DIR INSTALL_INCLUDE_DIR)

set(SHADERC_VERSION "${SHADERC_MAJOR_VERSION}.${SHADERC_MINOR_VERSION}.${SHADERC_PATCH_VERSION}")
write_basic_package_version_file(
    ${CMAKE_BINARY_DIR}/shadercConfigVersion.cmake
    VERSION ${SHADERC_VERSION} COMPATIBILITY SameMajorVersion)
    
install(FILES 
    ${CMAKE_BINARY_DIR}/shadercConfig.cmake 
    ${CMAKE_BINARY_DIR}/shadercConfigVersion.cmake
    DESTINATION ${INSTALL_CONFIG_DIR})
    
install(TARGETS shaderc EXPORT shadercConfig
    LIBRARY DESTINATION ${INSTALL_LIBRARY_DIR}
    ARCHIVE DESTINATION ${INSTALL_ARCHIVE_DIR}
    RUNTIME DESTINATION ${INSTALL_RUNTIME_DIR})
    
install(FILES ${HEADERS_PUBLIC} 
    DESTINATION ${INSTALL_INCLUDE_DIR})
