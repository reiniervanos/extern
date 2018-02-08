cmake_minimum_required(VERSION 3.4)
project(egl)

set(EGL_MAJOR_VERSION 1)
set(EGL_MINOR_VERSION 5)
set(INSTALL_CONFIG_DIR  ${CMAKE_INSTALL_PREFIX}/lib/cmake/egl)
set(INSTALL_INCLUDE_DIR ${CMAKE_INSTALL_PREFIX}/include)
set(INSTALL_LIBRARY_DIR ${CMAKE_INSTALL_PREFIX}/lib)
set(INSTALL_ARCHIVE_DIR ${CMAKE_INSTALL_PREFIX}/lib)
set(INSTALL_RUNTIME_DIR ${CMAKE_INSTALL_PREFIX}/bin)

include(cmake/eglLibrary.cmake)   
add_library(egl INTERFACE) 

include(CMakePackageConfigHelpers)
configure_package_config_file(
    cmake/eglConfig.cmake.in
    ${CMAKE_BINARY_DIR}/eglConfig.cmake
    INSTALL_DESTINATION ${INSTALL_CONFIG_DIR}
    PATH_VARS INSTALL_LIBRARY_DIR INSTALL_INCLUDE_DIR)

set(EGL_VERSION "${EGL_MAJOR_VERSION}.${EGL_MINOR_VERSION}")
write_basic_package_version_file(
    ${CMAKE_BINARY_DIR}/eglConfigVersion.cmake
    VERSION ${EGL_VERSION} COMPATIBILITY SameMajorVersion)
    
install(FILES 
    ${CMAKE_BINARY_DIR}/eglConfig.cmake 
    ${CMAKE_BINARY_DIR}/eglConfigVersion.cmake
    DESTINATION ${INSTALL_CONFIG_DIR})
    
install(TARGETS egl EXPORT eglConfig
    LIBRARY DESTINATION ${INSTALL_LIBRARY_DIR}
    ARCHIVE DESTINATION ${INSTALL_ARCHIVE_DIR}
    RUNTIME DESTINATION ${INSTALL_RUNTIME_DIR})
    
install(FILES ${HEADERS_PUBLIC_EGL} 
    DESTINATION ${INSTALL_INCLUDE_DIR}/EGL)

install(FILES ${HEADERS_PUBLIC_KHR} 
    DESTINATION ${INSTALL_INCLUDE_DIR}/KHR)
