cmake_minimum_required(VERSION 3.4)
project(gles)

set(GLES_MAJOR_VERSION 3)
set(GLES_MINOR_VERSION 2)
set(INSTALL_CONFIG_DIR  ${CMAKE_INSTALL_PREFIX}/lib/cmake/gles)
set(INSTALL_INCLUDE_DIR ${CMAKE_INSTALL_PREFIX}/include)
set(INSTALL_LIBRARY_DIR ${CMAKE_INSTALL_PREFIX}/lib)
set(INSTALL_ARCHIVE_DIR ${CMAKE_INSTALL_PREFIX}/lib)
set(INSTALL_RUNTIME_DIR ${CMAKE_INSTALL_PREFIX}/bin)

include(cmake/glesLibrary.cmake)
add_library(gles INTERFACE)

include(CMakePackageConfigHelpers)
configure_package_config_file(
    cmake/glesConfig.cmake.in
    ${CMAKE_BINARY_DIR}/glesConfig.cmake
    INSTALL_DESTINATION ${INSTALL_CONFIG_DIR}
    PATH_VARS INSTALL_LIBRARY_DIR INSTALL_INCLUDE_DIR)

set(GLES_VERSION "${GLES_MAJOR_VERSION}.${GLES_MINOR_VERSION}")
write_basic_package_version_file(
    ${CMAKE_BINARY_DIR}/glesConfigVersion.cmake
    VERSION ${GLES_VERSION} COMPATIBILITY SameMajorVersion)
    
install(FILES 
    ${CMAKE_BINARY_DIR}/glesConfig.cmake 
    ${CMAKE_BINARY_DIR}/glesConfigVersion.cmake
    DESTINATION ${INSTALL_CONFIG_DIR})
    
install(TARGETS gles EXPORT glesConfig
    LIBRARY DESTINATION ${INSTALL_LIBRARY_DIR}
    ARCHIVE DESTINATION ${INSTALL_ARCHIVE_DIR}
    RUNTIME DESTINATION ${INSTALL_RUNTIME_DIR})
    
install(FILES ${HEADERS_PUBLIC_GLES2} 
    DESTINATION ${INSTALL_INCLUDE_DIR}/GLES2)

install(FILES ${HEADERS_PUBLIC_GLES3} 
    DESTINATION ${INSTALL_INCLUDE_DIR}/GLES3)
