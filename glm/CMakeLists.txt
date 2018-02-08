cmake_minimum_required(VERSION 3.4)
project(glm VERSION 0.9.8.5 LANGUAGES CXX)

set(GLM_MAJOR_VERSION 0)
set(GLM_MINOR_VERSION 9)
set(GLM_PATCH_VERSION 8)
set(GLM_EXTRA_VERSION 5)
set(INSTALL_CONFIG_DIR  ${CMAKE_INSTALL_PREFIX}/lib/cmake/glm)
set(INSTALL_INCLUDE_DIR ${CMAKE_INSTALL_PREFIX}/include)
set(INSTALL_LIBRARY_DIR ${CMAKE_INSTALL_PREFIX}/lib)
set(INSTALL_ARCHIVE_DIR ${CMAKE_INSTALL_PREFIX}/lib)
set(INSTALL_RUNTIME_DIR ${CMAKE_INSTALL_PREFIX}/bin)

include(cmake/glmLibrary.cmake)
add_library(glm STATIC 
    ${HEADERS_PUBLIC}
    ${SOURCES_PRIVATE})
      
target_include_directories(glm
    PRIVATE ${CMAKE_SOURCE_DIR}/project)
    
target_compile_definitions(glm
    PRIVATE -DSOURCE_DIR)   
	
include(CMakePackageConfigHelpers)
configure_package_config_file(
    cmake/glmConfig.cmake.in
    ${CMAKE_BINARY_DIR}/glmConfig.cmake
    INSTALL_DESTINATION ${INSTALL_CONFIG_DIR}
    PATH_VARS INSTALL_LIBRARY_DIR INSTALL_INCLUDE_DIR)

set(GLM_VERSION "${GLM_MAJOR_VERSION}.${GLM_MINOR_VERSION}.${GLM_PATCH_VERSION}.${GLM_EXTRA_VERSION}")
write_basic_package_version_file(
    ${CMAKE_BINARY_DIR}/glmConfigVersion.cmake
    VERSION ${GLM_VERSION} COMPATIBILITY SameMajorVersion)
    
install(FILES 
    ${CMAKE_BINARY_DIR}/glmConfig.cmake 
    ${CMAKE_BINARY_DIR}/glmConfigVersion.cmake
    DESTINATION ${INSTALL_CONFIG_DIR})
    
install(TARGETS glm EXPORT glmConfig
    LIBRARY DESTINATION ${INSTALL_LIBRARY_DIR}
    ARCHIVE DESTINATION ${INSTALL_ARCHIVE_DIR}
    RUNTIME DESTINATION ${INSTALL_RUNTIME_DIR})
    
install(FILES ${HEADERS_ROOT} ${INLINE_ROOT}
	DESTINATION "${INSTALL_INCLUDE_DIR}/glm")
	
install(FILES ${HEADERS_CORE} ${INLINE_CORE}
	DESTINATION "${INSTALL_INCLUDE_DIR}/glm/detail")
	
install(FILES ${HEADERS_GTC}  ${INLINE_GTC}
	DESTINATION "${INSTALL_INCLUDE_DIR}/glm/gtc")
	
install(FILES ${HEADERS_GTX}  ${INLINE_GTX}
	DESTINATION "${INSTALL_INCLUDE_DIR}/glm/gtx")
	
install(FILES ${HEADERS_SIMD} ${INLINE_SIMD}
	DESTINATION "${INSTALL_INCLUDE_DIR}/glm/simd")
