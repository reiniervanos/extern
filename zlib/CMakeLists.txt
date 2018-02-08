cmake_minimum_required(VERSION 3.4)
project(zlib VERSION 1.2.11 LANGUAGES C)

set(ZLIB_MAJOR_VERSION 1)
set(ZLIB_MINOR_VERSION 2)
set(ZLIB_PATCH_VERSION 11)
set(INSTALL_CONFIG_DIR  ${CMAKE_INSTALL_PREFIX}/lib/cmake/zlib)
set(INSTALL_INCLUDE_DIR ${CMAKE_INSTALL_PREFIX}/include/zlib)
set(INSTALL_LIBRARY_DIR ${CMAKE_INSTALL_PREFIX}/lib)
set(INSTALL_ARCHIVE_DIR ${CMAKE_INSTALL_PREFIX}/lib)
set(INSTALL_RUNTIME_DIR ${CMAKE_INSTALL_PREFIX}/bin)
 
# Make relative paths absolute (needed later on)
foreach(p LIB BIN INCLUDE CMAKE)
  set(var INSTALL_${p}_DIR)
  if(NOT IS_ABSOLUTE "${${var}}")
    set(${var} "${CMAKE_INSTALL_PREFIX}/${${var}}")
  endif()
endforeach()


if(NOT DEFINED CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Release CACHE STRING "Build type")
endif()
set(CMAKE_DEBUG_POSTFIX "d" CACHE STRING "Set debug library postfix")
set(CMAKE_CONFIGURATION_TYPES Debug Release CACHE TYPE INTERNAL FORCE)

if(MSVC)
    add_definitions(-D_CRT_SECURE_NO_WARNINGS)
    add_definitions(-D_CRT_SECURE_NO_DEPRECATE)
    add_definitions(-D_CRT_NONSTDC_NO_DEPRECATE)
    add_compile_options(/wd4267)
endif()

include(cmake/zlibLibrary.cmake)   
add_library(zlib STATIC 
    ${HEADERS_PUBLIC} 
    ${HEADERS_PRIVATE}
    ${SOURCES_PRIVATE})

include(CheckIncludeFile)    
check_include_file(unistd.h Z_HAVE_UNISTD_H)
check_include_file(stdarg.h Z_HAVE_STDARG_H)
configure_file(	
    ${CMAKE_CURRENT_SOURCE_DIR}/project/zconf.h.cmakein
	${CMAKE_CURRENT_SOURCE_DIR}/project/zconf.h @ONLY)    
    
target_include_directories(zlib
    PRIVATE ${CMAKE_SOURCE_DIR}/project)

if(UNIX)
    set_target_properties(zlib PROPERTIES OUTPUT_NAME z)
endif()    

if(CMAKE_BUILD_TYPE MATCHES Release)
    target_compile_definitions(zlib PRIVATE -DNDEBUG)
endif()

include(CMakePackageConfigHelpers)
configure_package_config_file(
    cmake/zlibConfig.cmake.in
    ${CMAKE_BINARY_DIR}/zlibConfig.cmake
    INSTALL_DESTINATION ${INSTALL_CONFIG_DIR}
    PATH_VARS INSTALL_LIBRARY_DIR INSTALL_INCLUDE_DIR)

set(ZLIB_VERSION "${ZLIB_MAJOR_VERSION}.${ZLIB_MINOR_VERSION}.${ZLIB_PATCH_VERSION}")
write_basic_package_version_file(
    ${CMAKE_BINARY_DIR}/zlibConfigVersion.cmake
    VERSION ${ZLIB_VERSION} COMPATIBILITY SameMajorVersion)
    
install(FILES 
    ${CMAKE_BINARY_DIR}/zlibConfig.cmake 
    ${CMAKE_BINARY_DIR}/zlibConfigVersion.cmake
    DESTINATION ${INSTALL_CONFIG_DIR})
    
install(TARGETS zlib EXPORT zlibConfig
    LIBRARY DESTINATION ${INSTALL_LIBRARY_DIR}
    ARCHIVE DESTINATION ${INSTALL_ARCHIVE_DIR}
    RUNTIME DESTINATION ${INSTALL_RUNTIME_DIR})
    
install(FILES ${HEADERS_PUBLIC} 
    DESTINATION ${INSTALL_INCLUDE_DIR})
