cmake_minimum_required(VERSION 3.4)
project(assimp VERSION 4.0.1 LANGUAGES CXX)

find_package(ZLIB NAMES zlib REQUIRED)

find_package(OpenMP REQUIRED)
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${OpenMP_C_FLAGS}")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${OpenMP_CXX_FLAGS}")


set(ASSIMP_MAJOR_VERSION 4)
set(ASSIMP_MINOR_VERSION 0)
set(ASSIMP_PATCH_VERSION 1)
set(INSTALL_CONFIG_DIR  ${CMAKE_INSTALL_PREFIX}/lib/cmake/assimp)
set(INSTALL_INCLUDE_DIR ${CMAKE_INSTALL_PREFIX}/include/assimp)
set(INSTALL_LIBRARY_DIR ${CMAKE_INSTALL_PREFIX}/lib)
set(INSTALL_ARCHIVE_DIR ${CMAKE_INSTALL_PREFIX}/lib)
set(INSTALL_RUNTIME_DIR ${CMAKE_INSTALL_PREFIX}/bin)

set(GIT_COMMIT_HASH 0)
set(GIT_BRANCH "")
 
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

configure_file(
  ${CMAKE_SOURCE_DIR}/project/revision.h.in
  ${CMAKE_BINARY_DIR}/project/revision.h
)

configure_file(
  ${CMAKE_SOURCE_DIR}/project/include/assimp/config.h.in
  ${CMAKE_BINARY_DIR}/project/include/assimp/config.h
)

include(cmake/assimpLibrary.cmake)
add_library(assimp STATIC 
    ${HEADERS_PUBLIC} 
    ${HEADERS_PRIVATE}
    ${SOURCES_PRIVATE}
	${SOURCES_MODULES})
  
target_include_directories(assimp
	PRIVATE ${ZLIB_INCLUDE_DIR}
    PRIVATE ${CMAKE_SOURCE_DIR}/project/include
	PRIVATE ${CMAKE_SOURCE_DIR}/project/contrib/irrXML
	PRIVATE ${CMAKE_SOURCE_DIR}/project/openddlparser/include
	PRIVATE ${CMAKE_BINARY_DIR}/project
	PRIVATE ${CMAKE_BINARY_DIR}/project/include)
	
if(UNIX)
  # Ensure that we do not run into issues like http://www.tcm.phy.cam.ac.uk/sw/inodes64.html on 32 bit unix
  if ( CMAKE_SIZEOF_VOID_P EQUAL 4) # only necessary for 32-bit unix
    target_compile_definitions(assimp -D_FILE_OFFSET_BITS=64 )
  endif()
endif()

if(CMAKE_BUILD_TYPE MATCHES Release)
    target_compile_definitions(assimp PRIVATE -DNDEBUG)
endif()

target_compile_definitions(assimp 
	PRIVATE -DOPENDDL_NO_USE_CPP11
	PUBLIC  -DASSIMP_BUILD_NO_C4D_IMPORTER)
	
target_compile_features(assimp
    PRIVATE cxx_std_11)

include(CMakePackageConfigHelpers)
configure_package_config_file(
    cmake/assimpConfig.cmake.in
    ${CMAKE_BINARY_DIR}/assimpConfig.cmake
    INSTALL_DESTINATION ${INSTALL_CONFIG_DIR}
    PATH_VARS INSTALL_LIBRARY_DIR INSTALL_INCLUDE_DIR)

set(ASSIMP_VERSION "${ASSIMP_MAJOR_VERSION}.${ASSIMP_MINOR_VERSION}.${ASSIMP_PATCH_VERSION}")
write_basic_package_version_file(
    ${CMAKE_BINARY_DIR}/assimpConfigVersion.cmake
    VERSION ${ASSIMP_VERSION} COMPATIBILITY SameMajorVersion)
    
install(FILES 
    ${CMAKE_BINARY_DIR}/assimpConfig.cmake 
    ${CMAKE_BINARY_DIR}/assimpConfigVersion.cmake
    DESTINATION ${INSTALL_CONFIG_DIR})
    
install(TARGETS assimp EXPORT assimpConfig
    LIBRARY DESTINATION ${INSTALL_LIBRARY_DIR}
    ARCHIVE DESTINATION ${INSTALL_ARCHIVE_DIR}
    RUNTIME DESTINATION ${INSTALL_RUNTIME_DIR})
    
install(FILES ${HEADERS_PUBLIC} 
    DESTINATION ${INSTALL_INCLUDE_DIR})
