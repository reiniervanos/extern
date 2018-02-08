cmake_minimum_required(VERSION 3.4)
project(ktx VERSION 1.0 LANGUAGES CXX)

find_package(GLES NAMES gles REQUIRED)

set(KTX_MAJOR_VERSION 1)
set(KTX_MINOR_VERSION 0)
set(INSTALL_CONFIG_DIR  ${CMAKE_INSTALL_PREFIX}/lib/cmake/ktx)
set(INSTALL_INCLUDE_DIR ${CMAKE_INSTALL_PREFIX}/include/ktx)
set(INSTALL_LIBRARY_DIR ${CMAKE_INSTALL_PREFIX}/lib)
set(INSTALL_ARCHIVE_DIR ${CMAKE_INSTALL_PREFIX}/lib)
set(INSTALL_RUNTIME_DIR ${CMAKE_INSTALL_PREFIX}/bin)

if(NOT DEFINED CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Release CACHE STRING "Build type")
endif()
set(CMAKE_DEBUG_POSTFIX "d" CACHE STRING "Set debug library postfix")
set(CMAKE_CONFIGURATION_TYPES Debug Release CACHE TYPE INTERNAL FORCE)

if(MSVC)
    add_definitions(-D_CRT_SECURE_NO_WARNINGS)
    add_definitions(-D_CRT_SECURE_NO_DEPRECATE)
    add_definitions(-D_CRT_NONSTDC_NO_DEPRECATE)
endif()

include(cmake/ktxLibrary.cmake)
add_library(ktx STATIC 
    ${HEADERS_PUBLIC}
    ${HEADERS_PRIVATE}
    ${SOURCES_PRIVATE})  
    
target_include_directories(ktx
    PRIVATE ${GLES_INCLUDE_DIR}
    PRIVATE ${CMAKE_SOURCE_DIR}/project/include)  

target_compile_definitions(ktx
    PUBLIC -DKTX_OPENGL_ES3=1)

if(CMAKE_BUILD_TYPE MATCHES Release)
    target_compile_definitions(ktx PRIVATE -DNDEBUG)
endif()
    
include(CMakePackageConfigHelpers)
configure_package_config_file(
    cmake/ktxConfig.cmake.in
    ${CMAKE_BINARY_DIR}/ktxConfig.cmake
    INSTALL_DESTINATION ${INSTALL_CONFIG_DIR}
    PATH_VARS INSTALL_LIBRARY_DIR INSTALL_INCLUDE_DIR)

set(KTX_VERSION "${KTX_MAJOR_VERSION}.${KTX_MINOR_VERSION}")
write_basic_package_version_file(
    ${CMAKE_BINARY_DIR}/ktxConfigVersion.cmake
    VERSION ${KTX_VERSION} COMPATIBILITY SameMajorVersion)
    
install(FILES 
    ${CMAKE_BINARY_DIR}/ktxConfig.cmake 
    ${CMAKE_BINARY_DIR}/ktxConfigVersion.cmake
    DESTINATION ${INSTALL_CONFIG_DIR})
    
install(TARGETS ktx EXPORT ktxConfig
    LIBRARY DESTINATION ${INSTALL_LIBRARY_DIR}
    ARCHIVE DESTINATION ${INSTALL_ARCHIVE_DIR}
    RUNTIME DESTINATION ${INSTALL_RUNTIME_DIR})
    
install(FILES ${HEADERS_PUBLIC} 
    DESTINATION ${INSTALL_INCLUDE_DIR})
