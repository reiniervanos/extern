cmake_minimum_required(VERSION 3.4)
project(glslang VERSION 1.0 LANGUAGES CXX)

find_package(SPIRV NAMES spirv REQUIRED)

set(GLSLANG_MAJOR_VERSION 1)
set(GLSLANG_MINOR_VERSION 0)
set(INSTALL_CONFIG_DIR  ${CMAKE_INSTALL_PREFIX}/lib/cmake/glslang)
set(INSTALL_INCLUDE_DIR ${CMAKE_INSTALL_PREFIX}/include)
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

include(cmake/glslangLibrary.cmake)
add_library(glslang STATIC 
    ${HEADERS_PUBLIC}
    ${HEADERS_PRIVATE}
    ${SOURCES_PRIVATE})
	
  
target_include_directories(glslang
	PRIVATE ${SPIRV_INCLUDE_DIR}
	PRIVATE ${CMAKE_SOURCE_DIR}/project/glslang	
    PRIVATE ${CMAKE_SOURCE_DIR}/project/glslang/include
    PRIVATE ${CMAKE_SOURCE_DIR}/project/glslang/source
	PRIVATE ${CMAKE_SOURCE_DIR}/project/glslang/glslang/OSDependent)

target_compile_features(glslang
    PRIVATE cxx_std_11)

if(CMAKE_BUILD_TYPE MATCHES Release)
    target_compile_definitions(glslang PRIVATE -DNDEBUG)
endif()
    
include(CMakePackageConfigHelpers)
configure_package_config_file(
    cmake/glslangConfig.cmake.in
    ${CMAKE_BINARY_DIR}/glslangConfig.cmake
    INSTALL_DESTINATION ${INSTALL_CONFIG_DIR}
    PATH_VARS INSTALL_LIBRARY_DIR INSTALL_INCLUDE_DIR)

set(GLSLANG_VERSION "${GLSLANG_MAJOR_VERSION}.${GLSLANG_MINOR_VERSION}")
write_basic_package_version_file(
    ${CMAKE_BINARY_DIR}/glslangConfigVersion.cmake
    VERSION ${GLSLANG_VERSION} COMPATIBILITY SameMajorVersion)
    
install(FILES 
    ${CMAKE_BINARY_DIR}/glslangConfig.cmake 
    ${CMAKE_BINARY_DIR}/glslangConfigVersion.cmake
    DESTINATION ${INSTALL_CONFIG_DIR})
    
install(TARGETS glslang EXPORT glslangConfig
    LIBRARY DESTINATION ${INSTALL_LIBRARY_DIR}
    ARCHIVE DESTINATION ${INSTALL_ARCHIVE_DIR}
    RUNTIME DESTINATION ${INSTALL_RUNTIME_DIR})
    
install(FILES ${HEADERS_PUBLIC_PUBLIC} 
    DESTINATION ${INSTALL_INCLUDE_DIR}/glslang/Public)

install(FILES ${HEADERS_PUBLIC_INCLUDE} 
    DESTINATION ${INSTALL_INCLUDE_DIR}/glslang/Include)
	
install(FILES ${HEADERS_PUBLIC_INDEPEND} 
    DESTINATION ${INSTALL_INCLUDE_DIR}/glslang/MachineIndependent)
	
install(FILES ${HEADERS_PUBLIC_SPIRV} 
    DESTINATION ${INSTALL_INCLUDE_DIR}/glslang/SPIRV)
