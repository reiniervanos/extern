cmake_minimum_required(VERSION 3.4)
project(spirv VERSION 1.2 LANGUAGES CXX)

find_package(PythonInterp REQUIRED)

set(SPIRV_MAJOR_VERSION 1)
set(SPIRV_MINOR_VERSION 2)
set(INSTALL_CONFIG_DIR  ${CMAKE_INSTALL_PREFIX}/lib/cmake/spirv)
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

include(cmake/spirvLibrary.cmake)
add_library(spirv STATIC 
    ${HEADERS_PUBLIC}
    ${HEADERS_PRIVATE}
    ${SOURCES_PRIVATE})
	
add_dependencies(spirv 
	${SPIRV_TOOL_DEPENDS})
    
target_include_directories(spirv
	PRIVATE ${CMAKE_BINARY_DIR}/project/spirv-tools
    PRIVATE ${CMAKE_SOURCE_DIR}/project/spirv-headers/include
	PRIVATE ${CMAKE_SOURCE_DIR}/project/spirv-headers/source
    PRIVATE ${CMAKE_SOURCE_DIR}/project/spirv-tools/include
    PRIVATE ${CMAKE_SOURCE_DIR}/project/spirv-tools/source)

target_compile_features(spirv
    PRIVATE cxx_std_11)

if(CMAKE_BUILD_TYPE MATCHES Release)
    target_compile_definitions(spirv PRIVATE -DNDEBUG)
endif()

    
include(CMakePackageConfigHelpers)
configure_package_config_file(
    cmake/spirvConfig.cmake.in
    ${CMAKE_BINARY_DIR}/spirvConfig.cmake
    INSTALL_DESTINATION ${INSTALL_CONFIG_DIR}
    PATH_VARS INSTALL_LIBRARY_DIR INSTALL_INCLUDE_DIR)

set(SPIRV_VERSION "${SPIRV_MAJOR_VERSION}.${SPIRV_MINOR_VERSION}")
write_basic_package_version_file(
    ${CMAKE_BINARY_DIR}/spirvConfigVersion.cmake
    VERSION ${SPIRV_VERSION} COMPATIBILITY SameMajorVersion)
    
install(FILES 
    ${CMAKE_BINARY_DIR}/spirvConfig.cmake 
    ${CMAKE_BINARY_DIR}/spirvConfigVersion.cmake
    DESTINATION ${INSTALL_CONFIG_DIR})
    
install(TARGETS spirv EXPORT spirvConfig
    LIBRARY DESTINATION ${INSTALL_LIBRARY_DIR}
    ARCHIVE DESTINATION ${INSTALL_ARCHIVE_DIR}
    RUNTIME DESTINATION ${INSTALL_RUNTIME_DIR})
    
install(FILES ${HEADERS_PUBLIC_HEADERS_1_2} 
    DESTINATION ${INSTALL_INCLUDE_DIR}/spirv-headers)
	
install(FILES ${HEADERS_PUBLIC_HEADERS_1_2} 
    DESTINATION ${INSTALL_INCLUDE_DIR}/spirv-headers/spirv/1.2)
	
install(FILES ${HEADERS_PUBLIC_HEADERS_1_1} 
    DESTINATION ${INSTALL_INCLUDE_DIR}/spirv-headers/spirv/1.1)
	
install(FILES ${HEADERS_PUBLIC_HEADERS_1_0} 
    DESTINATION ${INSTALL_INCLUDE_DIR}/spirv-headers/spirv/1.0)

install(FILES ${HEADERS_PUBLIC_TOOLS} 
    DESTINATION ${INSTALL_INCLUDE_DIR}/spirv-tools)
