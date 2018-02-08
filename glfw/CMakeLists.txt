cmake_minimum_required(VERSION 3.4)
project(GLFW VERSION 3.2.1 LANGUAGES C)

set(GLFW_MAJOR_VERSION 3)
set(GLFW_MINOR_VERSION 2)
set(GLFW_PATCH_VERSION 1)
set(INSTALL_CONFIG_DIR  ${CMAKE_INSTALL_PREFIX}/lib/cmake/glfw)
set(INSTALL_INCLUDE_DIR ${CMAKE_INSTALL_PREFIX}/include/glfw)
set(INSTALL_LIBRARY_DIR ${CMAKE_INSTALL_PREFIX}/lib)
set(INSTALL_ARCHIVE_DIR ${CMAKE_INSTALL_PREFIX}/lib)
set(INSTALL_RUNTIME_DIR ${CMAKE_INSTALL_PREFIX}/bin)

find_package(Threads REQUIRED)
find_package(Vulkan REQUIRED)

if(MSVC)
    add_definitions(-D_CRT_SECURE_NO_WARNINGS)
    add_definitions(-D_CRT_SECURE_NO_DEPRECATE)
    add_definitions(-D_CRT_NONSTDC_NO_DEPRECATE)
endif()


if (WIN32)
    set(_GLFW_WIN32 1)
    message(STATUS "Using Win32 for window creation")
elseif (UNIX)
    set(_GLFW_WAYLAND 1)
    message(STATUS "Using Wayland for window creation")
else()
    message(FATAL_ERROR "No supported platform was detected")
endif()


list(APPEND GLFW_LIBRARIES_LIST ${VULKAN_STATIC_LIBRARY})

if (UNIX)
    find_library(RT_LIBRARY rt)
    mark_as_advanced(RT_LIBRARY)
    if (RT_LIBRARY)
        list(APPEND GLFW_LIBRARIES_LIST "${RT_LIBRARY}")
        list(APPEND GLFW_PKG_LIBS_LIST "-lrt")
    endif()

    find_library(MATH_LIBRARY m)
    mark_as_advanced(MATH_LIBRARY)
    if (MATH_LIBRARY)
        list(APPEND GLFW_LIBRARIES_LIST "${MATH_LIBRARY}")
        list(APPEND GLFW_PKG_LIBS_LIST "-lm")
    endif()

    if (CMAKE_DL_LIBS)
        list(APPEND GLFW_LIBRARIES_LIST "${CMAKE_DL_LIBS}")
        list(APPEND GLFW_PKG_LIBS_LIST "-l${CMAKE_DL_LIBS}")
    endif()
endif()


if (_GLFW_WIN32)
    list(APPEND GLFW_PKG_LIBS_LIST "-lgdi32")
    set(_GLFW_USE_HYBRID_HPG 1)
endif()

if (_GLFW_WAYLAND)
    find_package(ECM REQUIRED NO_MODULE)
	list(APPEND CMAKE_MODULE_PATH ${ECM_MODULE_PATH})
	list(APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/project/CMake/modules)

    find_package(Wayland REQUIRED)
    find_package(WaylandScanner REQUIRED)
    find_package(WaylandProtocols 1.1 REQUIRED)

    list(APPEND GLFW_PKG_DEPS_LIST "wayland-egl")

    list(APPEND GLFW_INCLUDE_DIRS_LIST "${Wayland_INCLUDE_DIR}")
    list(APPEND GLFW_LIBRARIES_LIST "${Wayland_LIBRARIES}" "${CMAKE_THREAD_LIBS_INIT}")

    find_package(XKBCommon REQUIRED)
    list(APPEND GLFW_PKG_DEPS_LIST "xkbcommon")
    list(APPEND GLFW_INCLUDE_DIRS_LIST "${XKBCOMMON_INCLUDE_DIRS}")
    list(APPEND GLFW_LIBRARIES_LIST "${XKBCOMMON_LIBRARY}")
endif()


include(cmake/glfwLibrary.cmake)
add_library(glfw 
    ${SOURCE_PLATFORM} 
    ${HEADERS_PLATFORM} )
    
target_compile_definitions(glfw 
    PRIVATE -D_GLFW_USE_CONFIG_H)
    
target_include_directories(glfw
   PRIVATE ${GLFW_SOURCE_DIR}/project/src
   PRIVATE ${GLFW_BINARY_DIR}/project/src
   PRIVATE ${GLFW_BINARY_DIR}
   PRIVATE ${GLFW_INCLUDE_DIRS_LIST})                         

configure_file(
    project/src/glfw_config.h.in 
    project/src/glfw_config.h 
    @ONLY)   
   
include(CMakePackageConfigHelpers)
configure_package_config_file(
    cmake/glfwConfig.cmake.in
    ${CMAKE_BINARY_DIR}/glfwConfig.cmake
    INSTALL_DESTINATION ${INSTALL_CONFIG_DIR}
    PATH_VARS INSTALL_LIBRARY_DIR INSTALL_INCLUDE_DIR)

set(GLFW_VERSION "${GLFW_MAJOR_VERSION}.${GLFW_MINOR_VERSION}.${GLFW_PATCH_VERSION}")
write_basic_package_version_file(
    ${CMAKE_BINARY_DIR}/glfwConfigVersion.cmake
    VERSION ${GLFW_VERSION} COMPATIBILITY SameMajorVersion)
    
install(FILES 
    ${CMAKE_BINARY_DIR}/glfwConfig.cmake 
    ${CMAKE_BINARY_DIR}/glfwConfigVersion.cmake
    DESTINATION ${INSTALL_CONFIG_DIR})
    
install(TARGETS glfw EXPORT glfwConfig
    LIBRARY DESTINATION ${INSTALL_LIBRARY_DIR}
    ARCHIVE DESTINATION ${INSTALL_ARCHIVE_DIR}
    RUNTIME DESTINATION ${INSTALL_RUNTIME_DIR})
    
install(FILES ${HEADERS_PUBLIC} 
    DESTINATION ${INSTALL_INCLUDE_DIR})
