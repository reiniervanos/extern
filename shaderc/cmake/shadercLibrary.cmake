
set(HEADERS_PUBLIC
    project/shaderc/libshaderc/include/shaderc/shaderc.h
    project/shaderc/libshaderc/include/shaderc/shaderc.hpp
)
    
set(HEADERS_PRIVATE
    project/shaderc/libshaderc/src/shaderc_private.h
    # util
    project/shaderc/libshaderc_util/include/libshaderc_util/counting_includer.h
    project/shaderc/libshaderc_util/include/libshaderc_util/file_finder.h
    project/shaderc/libshaderc_util/include/libshaderc_util/format.h
    project/shaderc/libshaderc_util/include/libshaderc_util/io.h
    project/shaderc/libshaderc_util/include/libshaderc_util/mutex.h
    project/shaderc/libshaderc_util/include/libshaderc_util/message.h
    project/shaderc/libshaderc_util/include/libshaderc_util/resources.h
    project/shaderc/libshaderc_util/include/libshaderc_util/spirv_tools_wrapper.h
    project/shaderc/libshaderc_util/include/libshaderc_util/string_piece.h
    project/shaderc/libshaderc_util/include/libshaderc_util/universal_unistd.h
    project/shaderc/libshaderc_util/include/libshaderc_util/version_profile.h
)
    
set(SOURCES_PRIVATE
    project/shaderc/libshaderc/src/shaderc.cc
    # util
    project/shaderc/libshaderc_util/src/compiler.cc
    project/shaderc/libshaderc_util/src/file_finder.cc
    project/shaderc/libshaderc_util/src/io.cc
    project/shaderc/libshaderc_util/src/message.cc
    project/shaderc/libshaderc_util/src/resources.cc
    project/shaderc/libshaderc_util/src/shader_stage.cc
    project/shaderc/libshaderc_util/src/spirv_tools_wrapper.cc
    project/shaderc/libshaderc_util/src/version_profile.cc
)
