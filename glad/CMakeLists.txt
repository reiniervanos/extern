cmake_minimum_required(VERSION 3.4)
project(glad VERSION 2.16 LANGUAGES C)

find_package(GLES NAMES gles REQUIRED)

set(GLAD_MAJOR_VERSION 2)
set(GLAD_MINOR_VERSION 16)
set(INSTALL_CONFIG_DIR  ${CMAKE_INSTALL_PREFIX}/lib/cmake/glad)
set(INSTALL_INCLUDE_DIR ${CMAKE_INSTALL_PREFIX}/include)
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

if (CMAKE_SYSTEM_NAME STREQUAL "Android")
	set(ANDROID true)
endif()

include(cmake/gladLibrary.cmake)
add_library(glad STATIC 
    ${HEADERS_PUBLIC}
	${HEADERS_KHRONOS}
    ${SOURCES_PRIVATE})
    
target_include_directories(glad
	PRIVATE ${GLES_INCLUDE_DIR}
    PRIVATE ${CMAKE_SOURCE_DIR}/project/include)

if(CMAKE_BUILD_TYPE MATCHES Release)
    target_compile_definitions(glad PRIVATE -DNDEBUG)
endif()
    
include(CMakePackageConfigHelpers)
configure_package_config_file(
    cmake/gladConfig.cmake.in
    ${CMAKE_BINARY_DIR}/gladConfig.cmake
    INSTALL_DESTINATION ${INSTALL_CONFIG_DIR}
    PATH_VARS INSTALL_LIBRARY_DIR INSTALL_INCLUDE_DIR)

set(GLAD_VERSION "${GLAD_MAJOR_VERSION}.${GLAD_MINOR_VERSION}")
write_basic_package_version_file(
    ${CMAKE_BINARY_DIR}/gladConfigVersion.cmake
    VERSION ${GLAD_VERSION} COMPATIBILITY SameMajorVersion)
    
install(FILES 
    ${CMAKE_BINARY_DIR}/gladConfig.cmake 
    ${CMAKE_BINARY_DIR}/gladConfigVersion.cmake
    DESTINATION ${INSTALL_CONFIG_DIR})
    
install(TARGETS glad EXPORT gladConfig
    LIBRARY DESTINATION ${INSTALL_LIBRARY_DIR}
    ARCHIVE DESTINATION ${INSTALL_ARCHIVE_DIR}
    RUNTIME DESTINATION ${INSTALL_RUNTIME_DIR})
    
install(FILES ${HEADERS_PUBLIC} 
    DESTINATION ${INSTALL_INCLUDE_DIR}/glad)
