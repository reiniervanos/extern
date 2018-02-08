cmake_minimum_required(VERSION 3.4)
project(gli VERSION 0.8.2 LANGUAGES CXX)

set(GLI_MAJOR_VERSION 0)
set(GLI_MINOR_VERSION 8)
set(GLI_PATCH_VERSION 2)
set(INSTALL_CONFIG_DIR  ${CMAKE_INSTALL_PREFIX}/lib/cmake/gli)
set(INSTALL_INCLUDE_DIR ${CMAKE_INSTALL_PREFIX}/include)
set(INSTALL_LIBRARY_DIR ${CMAKE_INSTALL_PREFIX}/lib)
set(INSTALL_ARCHIVE_DIR ${CMAKE_INSTALL_PREFIX}/lib)
set(INSTALL_RUNTIME_DIR ${CMAKE_INSTALL_PREFIX}/bin)

include(cmake/gliLibrary.cmake)
add_library(gli STATIC 
    ${HEADERS_PUBLIC}
    ${SOURCES_PRIVATE})
      
target_include_directories(gli
    PRIVATE ${CMAKE_SOURCE_DIR}/project)
    
target_compile_definitions(gli
    PRIVATE -DSOURCE_DIR)   
	
include(CMakePackageConfigHelpers)
configure_package_config_file(
    cmake/gliConfig.cmake.in
    ${CMAKE_BINARY_DIR}/gliConfig.cmake
    INSTALL_DESTINATION ${INSTALL_CONFIG_DIR}
    PATH_VARS INSTALL_LIBRARY_DIR INSTALL_INCLUDE_DIR)

set(GLI_VERSION "${GLI_MAJOR_VERSION}.${GLI_MINOR_VERSION}.${GLI_PATCH_VERSION}")
write_basic_package_version_file(
    ${CMAKE_BINARY_DIR}/gliConfigVersion.cmake
    VERSION ${GLI_VERSION} COMPATIBILITY SameMajorVersion)
    
install(FILES 
    ${CMAKE_BINARY_DIR}/gliConfig.cmake 
    ${CMAKE_BINARY_DIR}/gliConfigVersion.cmake
    DESTINATION ${INSTALL_CONFIG_DIR})
    
install(TARGETS gli EXPORT gliConfig
    LIBRARY DESTINATION ${INSTALL_LIBRARY_DIR}
    ARCHIVE DESTINATION ${INSTALL_ARCHIVE_DIR}
    RUNTIME DESTINATION ${INSTALL_RUNTIME_DIR})
    
install(FILES ${HEADERS_ROOT} ${INLINE_ROOT}
	DESTINATION ${INSTALL_INCLUDE_DIR}/gli)
	
install(FILES ${HEADERS_CORE} ${INLINE_CORE}
	DESTINATION ${INSTALL_INCLUDE_DIR}/gli/core)
