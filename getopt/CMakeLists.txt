cmake_minimum_required(VERSION 3.4)
project(getopt LANGUAGES C)

set(GETOPT_MAJOR_VERSION 1)
set(GETOPT_MINOR_VERSION 0)
set(INSTALL_CONFIG_DIR  ${CMAKE_INSTALL_PREFIX}/lib/cmake/getopt)
set(INSTALL_INCLUDE_DIR ${CMAKE_INSTALL_PREFIX}/include/getopt)
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
	add_compile_options(/wd4244)
endif()


include(cmake/getoptLibrary.cmake)
add_library(getopt STATIC 
    ${HEADERS_PUBLIC}
    ${SOURCES_PRIVATE})  
    
target_include_directories(getopt
    PRIVATE ${CMAKE_SOURCE_DIR}/project)  

target_compile_definitions(getopt
    PUBLIC -DSTB_IMAGE_STATIC
    PUBLIC -DSTB_IMAGE_WRITE_STATIC)

if(CMAKE_BUILD_TYPE MATCHES Release)
    target_compile_definitions(getopt PRIVATE -DNDEBUG)
endif()
    
include(CMakePackageConfigHelpers)
configure_package_config_file(
    cmake/getoptConfig.cmake.in
    ${CMAKE_BINARY_DIR}/getoptConfig.cmake
    INSTALL_DESTINATION ${INSTALL_CONFIG_DIR}
    PATH_VARS INSTALL_LIBRARY_DIR INSTALL_INCLUDE_DIR)

set(GETOPT_VERSION "${GETOPT_MAJOR_VERSION}.${GETOPT_MINOR_VERSION}")
write_basic_package_version_file(
    ${CMAKE_BINARY_DIR}/getoptConfigVersion.cmake
    VERSION ${GETOPT_VERSION} COMPATIBILITY SameMajorVersion)
    
install(FILES 
    ${CMAKE_BINARY_DIR}/getoptConfig.cmake 
    ${CMAKE_BINARY_DIR}/getoptConfigVersion.cmake
    DESTINATION ${INSTALL_CONFIG_DIR})
    
install(TARGETS getopt EXPORT getoptConfig
    LIBRARY DESTINATION ${INSTALL_LIBRARY_DIR}
    ARCHIVE DESTINATION ${INSTALL_ARCHIVE_DIR}
    RUNTIME DESTINATION ${INSTALL_RUNTIME_DIR})
    
install(FILES ${HEADERS_PUBLIC} 
    DESTINATION ${INSTALL_INCLUDE_DIR})
