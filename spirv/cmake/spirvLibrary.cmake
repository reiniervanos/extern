
#add_definitions(-DSPIRV_LOG_DEBUG)
#add_definitions(-DSPIRV_CHECK_CONTEXT)
add_definitions(-DSPIRV_COLOR_TERMINAL)
if(ANDROID OR UNIX)
    add_definitions(-DSPIRV_LINUX)
elseif(WIN32)
    add_definitions(-DSPIRV_WINDOWS)
endif()

set(HEADERS_PUBLIC_HEADERS_1_0
    project/spirv-headers/include/spirv/1.0/spirv.h
    project/spirv-headers/include/spirv/1.0/spirv.hpp
    project/spirv-headers/include/spirv/1.0/spirv.hpp11
    project/spirv-headers/include/spirv/1.0/GLSL.std.450.h
    project/spirv-headers/include/spirv/1.0/OpenCL.std.h
)

set(HEADERS_PUBLIC_HEADERS_1_1
    project/spirv-headers/include/spirv/1.1/spirv.h
    project/spirv-headers/include/spirv/1.1/spirv.hpp
    project/spirv-headers/include/spirv/1.1/spirv.hpp11
    project/spirv-headers/include/spirv/1.1/GLSL.std.450.h
    project/spirv-headers/include/spirv/1.1/OpenCL.std.h
)

set(HEADERS_PUBLIC_HEADERS_1_2
    project/spirv-headers/include/spirv/1.2/spirv.h
    project/spirv-headers/include/spirv/1.2/spirv.hpp
    project/spirv-headers/include/spirv/1.2/spirv.hpp11
    project/spirv-headers/include/spirv/1.2/GLSL.std.450.h
    project/spirv-headers/include/spirv/1.2/OpenCL.std.h
)

set(HEADERS_PUBLIC_HEADERS
	${HEADERS_PUBLIC_HEADERS_1_0}
	${HEADERS_PUBLIC_HEADERS_1_1}
	${HEADERS_PUBLIC_HEADERS_1_2}
)

set(HEADERS_PUBLIC_TOOLS
    project/spirv-tools/include/spirv-tools/libspirv.h
    project/spirv-tools/include/spirv-tools/libspirv.hpp
    project/spirv-tools/include/spirv-tools/optimizer.hpp
    project/spirv-tools/include/spirv-tools/linker.hpp
)


set(HEADERS_PUBLIC
	${HEADERS_PUBLIC_HEADERS}
	${HEADERS_PUBLIC_TOOLS}
)
    
set(HEADERS_PRIVATE
	# tools
    project/spirv-tools/source/assembly_grammar.h
    project/spirv-tools/source/util/bitutils.h
    project/spirv-tools/source/util/bit_stream.h
    project/spirv-tools/source/util/hex_float.h
    project/spirv-tools/source/util/parse_number.h
    project/spirv-tools/source/util/string_utils.h
    project/spirv-tools/source/assembly_grammar.h
    project/spirv-tools/source/binary.h
    project/spirv-tools/source/cfa.h
    project/spirv-tools/source/diagnostic.h
    project/spirv-tools/source/enum_set.h
    project/spirv-tools/source/enum_string_mapping.h
    project/spirv-tools/source/ext_inst.h
    project/spirv-tools/source/extensions.h
    project/spirv-tools/source/id_descriptor.h
    project/spirv-tools/source/instruction.h
    project/spirv-tools/source/macro.h
    project/spirv-tools/source/name_mapper.h
    project/spirv-tools/source/opcode.h
    project/spirv-tools/source/operand.h
    project/spirv-tools/source/parsed_operand.h
    project/spirv-tools/source/print.h
    project/spirv-tools/source/spirv_constant.h
    project/spirv-tools/source/spirv_definition.h
    project/spirv-tools/source/spirv_endian.h
    project/spirv-tools/source/spirv_target_env.h
    project/spirv-tools/source/spirv_validator_options.h
    project/spirv-tools/source/table.h
    project/spirv-tools/source/text.h
    project/spirv-tools/source/text_handler.h
    project/spirv-tools/source/validate.h
    # comp
    project/spirv-tools/source/comp/markv.h
    project/spirv-tools/source/comp/markv_model.h
    # opt
    project/spirv-tools/source/opt/aggressive_dead_code_elim_pass.h
    project/spirv-tools/source/opt/basic_block.h
    project/spirv-tools/source/opt/block_merge_pass.h
    project/spirv-tools/source/opt/build_module.h
    project/spirv-tools/source/opt/cfg_cleanup_pass.h
    project/spirv-tools/source/opt/cfg.h
    project/spirv-tools/source/opt/common_uniform_elim_pass.h
    project/spirv-tools/source/opt/compact_ids_pass.h
    project/spirv-tools/source/opt/constants.h
    project/spirv-tools/source/opt/dead_branch_elim_pass.h
    project/spirv-tools/source/opt/dead_variable_elimination.h
    project/spirv-tools/source/opt/decoration_manager.h
    project/spirv-tools/source/opt/def_use_manager.h
    project/spirv-tools/source/opt/eliminate_dead_constant_pass.h
    project/spirv-tools/source/opt/eliminate_dead_functions_pass.h
    project/spirv-tools/source/opt/flatten_decoration_pass.h
    project/spirv-tools/source/opt/fold.h
    project/spirv-tools/source/opt/fold_spec_constant_op_and_composite_pass.h
    project/spirv-tools/source/opt/freeze_spec_constant_value_pass.h
    project/spirv-tools/source/opt/function.h
    project/spirv-tools/source/opt/inline_exhaustive_pass.h
    project/spirv-tools/source/opt/inline_opaque_pass.h
    project/spirv-tools/source/opt/inline_pass.h
    project/spirv-tools/source/opt/insert_extract_elim.h
    project/spirv-tools/source/opt/instruction.h
    project/spirv-tools/source/opt/ir_context.h
    project/spirv-tools/source/opt/ir_loader.h
    project/spirv-tools/source/opt/local_access_chain_convert_pass.h
    project/spirv-tools/source/opt/local_redundancy_elimination.h
    project/spirv-tools/source/opt/local_single_block_elim_pass.h
    project/spirv-tools/source/opt/local_single_store_elim_pass.h
    project/spirv-tools/source/opt/local_ssa_elim_pass.h
    project/spirv-tools/source/opt/log.h
    project/spirv-tools/source/opt/mem_pass.h
    project/spirv-tools/source/opt/merge_return_pass.h
    project/spirv-tools/source/opt/module.h
    project/spirv-tools/source/opt/null_pass.h
    project/spirv-tools/source/opt/passes.h
    project/spirv-tools/source/opt/pass.h
    project/spirv-tools/source/opt/pass_manager.h
    project/spirv-tools/source/opt/propagator.h
    project/spirv-tools/source/opt/reflect.h
    project/spirv-tools/source/opt/remove_duplicates_pass.h
    project/spirv-tools/source/opt/set_spec_constant_default_value_pass.h
    project/spirv-tools/source/opt/strength_reduction_pass.h
    project/spirv-tools/source/opt/strip_debug_info_pass.h
    project/spirv-tools/source/opt/type_manager.h
    project/spirv-tools/source/opt/types.h
    project/spirv-tools/source/opt/unify_const_pass.h
    project/spirv-tools/source/opt/value_number_table.h
)

set(SOURCES_PRIVATE
    project/spirv-tools/source/util/bit_stream.cpp
    project/spirv-tools/source/util/parse_number.cpp
    project/spirv-tools/source/util/string_utils.cpp
    project/spirv-tools/source/assembly_grammar.cpp
    project/spirv-tools/source/binary.cpp
    project/spirv-tools/source/diagnostic.cpp
    project/spirv-tools/source/disassemble.cpp
    project/spirv-tools/source/enum_string_mapping.cpp
    project/spirv-tools/source/ext_inst.cpp
    project/spirv-tools/source/extensions.cpp
    project/spirv-tools/source/id_descriptor.cpp
    project/spirv-tools/source/libspirv.cpp
    project/spirv-tools/source/message.cpp
    project/spirv-tools/source/name_mapper.cpp
    project/spirv-tools/source/opcode.cpp
    project/spirv-tools/source/operand.cpp
    project/spirv-tools/source/parsed_operand.cpp
    project/spirv-tools/source/print.cpp
    project/spirv-tools/source/software_version.cpp
    project/spirv-tools/source/spirv_endian.cpp
    project/spirv-tools/source/spirv_stats.cpp
    project/spirv-tools/source/spirv_target_env.cpp
    project/spirv-tools/source/spirv_validator_options.cpp
    project/spirv-tools/source/table.cpp
    project/spirv-tools/source/text.cpp
    project/spirv-tools/source/text_handler.cpp
    project/spirv-tools/source/validate.cpp
    project/spirv-tools/source/validate_arithmetics.cpp
    project/spirv-tools/source/validate_bitwise.cpp
    project/spirv-tools/source/validate_capability.cpp
    project/spirv-tools/source/validate_cfg.cpp
    project/spirv-tools/source/validate_conversion.cpp
    project/spirv-tools/source/validate_datarules.cpp
    project/spirv-tools/source/validate_decorations.cpp
    project/spirv-tools/source/validate_derivatives.cpp
    project/spirv-tools/source/validate_id.cpp
    project/spirv-tools/source/validate_image.cpp
    project/spirv-tools/source/validate_instruction.cpp
    project/spirv-tools/source/validate_layout.cpp
    project/spirv-tools/source/validate_logicals.cpp
    project/spirv-tools/source/validate_type_unique.cpp
    project/spirv-tools/source/val/decoration.h
    project/spirv-tools/source/val/basic_block.cpp
    project/spirv-tools/source/val/construct.cpp
    project/spirv-tools/source/val/function.cpp
    project/spirv-tools/source/val/instruction.cpp
    project/spirv-tools/source/val/validation_state.cpp
    # comp
    project/spirv-tools/source/comp/markv_codec.cpp
    #opt
    project/spirv-tools/source/opt/aggressive_dead_code_elim_pass.cpp
    project/spirv-tools/source/opt/basic_block.cpp
    project/spirv-tools/source/opt/block_merge_pass.cpp
    project/spirv-tools/source/opt/build_module.cpp
    project/spirv-tools/source/opt/cfg_cleanup_pass.cpp
    project/spirv-tools/source/opt/cfg.cpp
    project/spirv-tools/source/opt/common_uniform_elim_pass.cpp
    project/spirv-tools/source/opt/compact_ids_pass.cpp
    project/spirv-tools/source/opt/dead_branch_elim_pass.cpp
    project/spirv-tools/source/opt/dead_variable_elimination.cpp
    project/spirv-tools/source/opt/decoration_manager.cpp
    project/spirv-tools/source/opt/def_use_manager.cpp
    project/spirv-tools/source/opt/eliminate_dead_constant_pass.cpp
    project/spirv-tools/source/opt/eliminate_dead_functions_pass.cpp
    project/spirv-tools/source/opt/flatten_decoration_pass.cpp
    project/spirv-tools/source/opt/fold.cpp
    project/spirv-tools/source/opt/fold_spec_constant_op_and_composite_pass.cpp
    project/spirv-tools/source/opt/freeze_spec_constant_value_pass.cpp
    project/spirv-tools/source/opt/function.cpp
    project/spirv-tools/source/opt/inline_exhaustive_pass.cpp
    project/spirv-tools/source/opt/inline_opaque_pass.cpp
    project/spirv-tools/source/opt/inline_pass.cpp
    project/spirv-tools/source/opt/insert_extract_elim.cpp
    project/spirv-tools/source/opt/instruction.cpp
    project/spirv-tools/source/opt/instruction_list.cpp
    project/spirv-tools/source/opt/ir_context.cpp
    project/spirv-tools/source/opt/ir_loader.cpp
    project/spirv-tools/source/opt/local_access_chain_convert_pass.cpp
    project/spirv-tools/source/opt/local_redundancy_elimination.cpp
    project/spirv-tools/source/opt/local_single_block_elim_pass.cpp
    project/spirv-tools/source/opt/local_single_store_elim_pass.cpp
    project/spirv-tools/source/opt/local_ssa_elim_pass.cpp
    project/spirv-tools/source/opt/mem_pass.cpp
    project/spirv-tools/source/opt/merge_return_pass.cpp
    project/spirv-tools/source/opt/module.cpp
    project/spirv-tools/source/opt/optimizer.cpp
    project/spirv-tools/source/opt/pass.cpp
    project/spirv-tools/source/opt/pass_manager.cpp
    project/spirv-tools/source/opt/propagator.cpp
    project/spirv-tools/source/opt/remove_duplicates_pass.cpp
    project/spirv-tools/source/opt/set_spec_constant_default_value_pass.cpp
    project/spirv-tools/source/opt/strength_reduction_pass.cpp
    project/spirv-tools/source/opt/strip_debug_info_pass.cpp
    project/spirv-tools/source/opt/type_manager.cpp
    project/spirv-tools/source/opt/types.cpp
    project/spirv-tools/source/opt/unify_const_pass.cpp
    project/spirv-tools/source/opt/value_number_table.cpp
    # link
    project/spirv-tools/source/link/linker.cpp
)

set(SPIRV_HEADER_INCLUDE_DIR
	project/spirv-headers/include)

# ---------------------------------------------------------------------------

set(GRAMMAR_PROCESSING_SCRIPT      "${CMAKE_SOURCE_DIR}/project/spirv-tools/utils/generate_grammar_tables.py")
set(XML_REGISTRY_PROCESSING_SCRIPT "${CMAKE_SOURCE_DIR}/project/spirv-tools/utils/generate_registry_tables.py")

# macro() definitions are used in the following because we need to append .inc
# file paths into some global lists (*_CPP_DEPENDS). And those global lists are
# later used by set_source_files_properties() calls.
# function() definitions are not suitable because they create new scopes.
macro(spvtools_core_tables VERSION)
    set(GRAMMAR_JSON_FILE "${CMAKE_SOURCE_DIR}/${SPIRV_HEADER_INCLUDE_DIR}/spirv/${VERSION}/spirv.core.grammar.json")
    set(GRAMMAR_INSTS_INC_FILE "${CMAKE_BINARY_DIR}/project/spirv-tools/core.insts-${VERSION}.inc")
    set(GRAMMAR_KINDS_INC_FILE "${CMAKE_BINARY_DIR}/project/spirv-tools/operand.kinds-${VERSION}.inc")
	set(SPIRV_TOOL_TARGET spirv-tools-core_tables-${VERSION})
    add_custom_command(OUTPUT ${GRAMMAR_INSTS_INC_FILE} ${GRAMMAR_KINDS_INC_FILE}
		COMMAND ${PYTHON_EXECUTABLE} ${GRAMMAR_PROCESSING_SCRIPT}
			--spirv-core-grammar=${GRAMMAR_JSON_FILE}
			--core-insts-output=${GRAMMAR_INSTS_INC_FILE}
			--operand-kinds-output=${GRAMMAR_KINDS_INC_FILE}
		DEPENDS ${GRAMMAR_PROCESSING_SCRIPT} ${GRAMMAR_JSON_FILE}
		COMMENT "Generate info tables for SPIR-V v${VERSION} core instructions and operands.")
    list(APPEND OPCODE_CPP_DEPENDS ${GRAMMAR_INSTS_INC_FILE})
    list(APPEND OPERAND_CPP_DEPENDS ${GRAMMAR_KINDS_INC_FILE})
	list(APPEND SPIRV_TOOL_DEPENDS ${SPIRV_TOOL_TARGET})
	add_custom_target(${SPIRV_TOOL_TARGET} DEPENDS ${GRAMMAR_INSTS_INC_FILE} ${GRAMMAR_KINDS_INC_FILE})
endmacro(spvtools_core_tables)

macro(spvtools_enum_string_mapping VERSION)
    set(GRAMMAR_JSON_FILE "${CMAKE_SOURCE_DIR}/${SPIRV_HEADER_INCLUDE_DIR}/spirv/${VERSION}/spirv.core.grammar.json")
    set(GRAMMAR_EXTENSION_ENUM_INC_FILE "${CMAKE_BINARY_DIR}/project/spirv-tools/extension_enum.inc")
    set(GRAMMAR_ENUM_STRING_MAPPING_INC_FILE "${CMAKE_BINARY_DIR}/project/spirv-tools/enum_string_mapping.inc")
	set(SPIRV_TOOL_TARGET spirv-tools-enum-string-mapping)
    add_custom_command(OUTPUT ${GRAMMAR_EXTENSION_ENUM_INC_FILE}
		${GRAMMAR_ENUM_STRING_MAPPING_INC_FILE}
		COMMAND ${PYTHON_EXECUTABLE} ${GRAMMAR_PROCESSING_SCRIPT}
			--spirv-core-grammar=${GRAMMAR_JSON_FILE}
			--extension-enum-output=${GRAMMAR_EXTENSION_ENUM_INC_FILE}
			--enum-string-mapping-output=${GRAMMAR_ENUM_STRING_MAPPING_INC_FILE}
		DEPENDS ${GRAMMAR_PROCESSING_SCRIPT} ${GRAMMAR_JSON_FILE}
		COMMENT "Generate enum-string mapping for SPIR-V v${VERSION}.")
    list(APPEND EXTENSION_H_DEPENDS ${GRAMMAR_EXTENSION_ENUM_INC_FILE})
    list(APPEND ENUM_STRING_MAPPING_CPP_DEPENDS ${GRAMMAR_ENUM_STRING_MAPPING_INC_FILE})
	list(APPEND SPIRV_TOOL_DEPENDS ${SPIRV_TOOL_TARGET})
	add_custom_target(${SPIRV_TOOL_TARGET} DEPENDS ${GRAMMAR_EXTENSION_ENUM_INC_FILE} ${GRAMMAR_ENUM_STRING_MAPPING_INC_FILE})
endmacro(spvtools_enum_string_mapping)

macro(spvtools_glsl_tables VERSION)
    set(CORE_GRAMMAR_JSON_FILE "${CMAKE_SOURCE_DIR}/${SPIRV_HEADER_INCLUDE_DIR}/spirv/${VERSION}/spirv.core.grammar.json")
    set(GLSL_GRAMMAR_JSON_FILE "${CMAKE_SOURCE_DIR}/${SPIRV_HEADER_INCLUDE_DIR}/spirv/${VERSION}/extinst.glsl.std.450.grammar.json")
    set(GRAMMAR_INC_FILE "${CMAKE_BINARY_DIR}/project/spirv-tools/glsl.std.450.insts-${VERSION}.inc")
	set(SPIRV_TOOL_TARGET spirv-tools-glsl-tables-${VERSION})
    add_custom_command(OUTPUT ${GRAMMAR_INC_FILE}
		COMMAND ${PYTHON_EXECUTABLE} ${GRAMMAR_PROCESSING_SCRIPT}
			--spirv-core-grammar=${CORE_GRAMMAR_JSON_FILE}
			--extinst-glsl-grammar=${GLSL_GRAMMAR_JSON_FILE}
			--glsl-insts-output=${GRAMMAR_INC_FILE}
		DEPENDS ${GRAMMAR_PROCESSING_SCRIPT} ${CORE_GRAMMAR_JSON_FILE} ${GLSL_GRAMMAR_JSON_FILE}
		COMMENT "Generate info tables for GLSL extended instructions and operands v${VERSION}.")
    list(APPEND EXTINST_CPP_DEPENDS ${GRAMMAR_INC_FILE})
	list(APPEND SPIRV_TOOL_DEPENDS ${SPIRV_TOOL_TARGET})
	add_custom_target(${SPIRV_TOOL_TARGET} DEPENDS ${GRAMMAR_INC_FILE})
endmacro(spvtools_glsl_tables)

macro(spvtools_opencl_tables VERSION)
	set(CORE_GRAMMAR_JSON_FILE "${CMAKE_SOURCE_DIR}/${SPIRV_HEADER_INCLUDE_DIR}/spirv/${VERSION}/spirv.core.grammar.json")
	set(OPENCL_GRAMMAR_JSON_FILE "${CMAKE_SOURCE_DIR}/${SPIRV_HEADER_INCLUDE_DIR}/spirv/${VERSION}/extinst.opencl.std.100.grammar.json")
	set(GRAMMAR_INC_FILE "${CMAKE_BINARY_DIR}/project/spirv-tools/opencl.std.insts-${VERSION}.inc")
	set(SPIRV_TOOL_TARGET spirv-tools-opencl-tables-${VERSION})
	add_custom_command(OUTPUT ${GRAMMAR_INC_FILE}
		COMMAND ${PYTHON_EXECUTABLE} ${GRAMMAR_PROCESSING_SCRIPT}
			--spirv-core-grammar=${CORE_GRAMMAR_JSON_FILE}
			--extinst-opencl-grammar=${OPENCL_GRAMMAR_JSON_FILE}
			--opencl-insts-output=${GRAMMAR_INC_FILE}
		DEPENDS ${GRAMMAR_PROCESSING_SCRIPT} ${CORE_GRAMMAR_JSON_FILE} ${OPENCL_GRAMMAR_JSON_FILE}
		COMMENT "Generate info tables for OpenCL extended instructions and operands v${VERSION}.")
	list(APPEND EXTINST_CPP_DEPENDS ${GRAMMAR_INC_FILE})
	list(APPEND SPIRV_TOOL_DEPENDS ${SPIRV_TOOL_TARGET})
	add_custom_target(${SPIRV_TOOL_TARGET} DEPENDS ${GRAMMAR_INC_FILE})
endmacro(spvtools_opencl_tables)

macro(spvtools_vendor_tables VENDOR_TABLE)
    set(INSTS_FILE "${CMAKE_BINARY_DIR}/project/spirv-tools/${VENDOR_TABLE}.insts.inc")
    set(GRAMMAR_FILE "${CMAKE_SOURCE_DIR}/project/spirv-tools/source/extinst.${VENDOR_TABLE}.grammar.json")
	set(SPIRV_TOOL_TARGET spirv-tools-${VENDOR_TABLE})
    add_custom_command(OUTPUT ${INSTS_FILE}
		COMMAND ${PYTHON_EXECUTABLE} ${GRAMMAR_PROCESSING_SCRIPT}
			--extinst-vendor-grammar=${GRAMMAR_FILE}
			--vendor-insts-output=${INSTS_FILE}
		DEPENDS ${GRAMMAR_PROCESSING_SCRIPT} ${GRAMMAR_FILE}
		COMMENT "Generate extended instruction tables for ${VENDOR_TABLE}.")
    list(APPEND EXTINST_CPP_DEPENDS ${INSTS_FILE})
	list(APPEND SPIRV_TOOL_DEPENDS ${SPIRV_TOOL_TARGET})
    add_custom_target(${SPIRV_TOOL_TARGET} DEPENDS ${INSTS_FILE})
endmacro(spvtools_vendor_tables)

spvtools_core_tables("1.0")
spvtools_core_tables("1.1")
spvtools_core_tables("1.2")
spvtools_glsl_tables("1.0")
spvtools_opencl_tables("1.0")
spvtools_enum_string_mapping("1.2")
spvtools_vendor_tables("spv-amd-shader-explicit-vertex-parameter")
spvtools_vendor_tables("spv-amd-shader-trinary-minmax")
spvtools_vendor_tables("spv-amd-gcn-shader")
spvtools_vendor_tables("spv-amd-shader-ballot")

# Extract the list of known generators from the SPIR-V XML registry file.
set(GENERATOR_INC_FILE ${CMAKE_BINARY_DIR}/project/spirv-tools/generators.inc)
set(SPIRV_XML_REGISTRY_FILE ${CMAKE_SOURCE_DIR}/${SPIRV_HEADER_INCLUDE_DIR}/spirv/spir-v.xml)
set(SPIRV_TOOL_TARGET spirv-tools-generator)
add_custom_command(OUTPUT ${GENERATOR_INC_FILE}
    COMMAND ${PYTHON_EXECUTABLE} ${XML_REGISTRY_PROCESSING_SCRIPT}
    --xml=${SPIRV_XML_REGISTRY_FILE}
    --generator-output=${GENERATOR_INC_FILE}
    DEPENDS ${XML_REGISTRY_PROCESSING_SCRIPT} ${SPIRV_XML_REGISTRY_FILE}
    COMMENT "Generate tables based on the SPIR-V XML registry.")
list(APPEND OPCODE_CPP_DEPENDS ${GENERATOR_INC_FILE})
list(APPEND SPIRV_TOOL_DEPENDS ${SPIRV_TOOL_TARGET})
add_custom_target(${SPIRV_TOOL_TARGET} DEPENDS ${GENERATOR_INC_FILE})

# The following .cpp files include the above generated .inc files.
# Add those .inc files as their dependencies.
set_source_files_properties(
    ${CMAKE_SOURCE_DIR}/project/spirv-tools/opcode.cpp
    PROPERTIES OBJECT_DEPENDS "${OPCODE_CPP_DEPENDS}")
	
set_source_files_properties(
    ${CMAKE_SOURCE_DIR}/project/spirv-tools/operand.cpp
    PROPERTIES OBJECT_DEPENDS "${OPERAND_CPP_DEPENDS}")
	
set_source_files_properties(
    ${CMAKE_SOURCE_DIR}/project/spirv-tools/ext_inst.cpp
    PROPERTIES OBJECT_DEPENDS "${EXTINST_CPP_DEPENDS}")
	
set_source_files_properties(
    ${CMAKE_SOURCE_DIR}/project/spirv-tools/enum_string_mapping.cpp
    PROPERTIES OBJECT_DEPENDS "${ENUM_STRING_MAPPING_CPP_DEPENDS}")

set_source_files_properties(
    ${CMAKE_SOURCE_DIR}/project/spirv-tools/extension.h
	PROPERTIES OBJECT_DEPENDS "${EXTENSION_H_DEPENDS}"
               HEADER_FILE_ONLY TRUE)
	
set(SPIRV_TOOLS_BUILD_VERSION_INC
    ${CMAKE_BINARY_DIR}/project/spirv-tools/build-version.inc)
	
set(SPIRV_TOOLS_BUILD_VERSION_INC_GENERATOR
    ${CMAKE_SOURCE_DIR}/project/spirv-tools/utils/update_build_version.py)
	
set(SPIRV_TOOLS_CHANGES_FILE
    ${CMAKE_SOURCE_DIR}/project/spirv-tools/CHANGES)

set(SPIRV_TOOL_TARGET spirv-tools-build-version)
add_custom_command(OUTPUT ${SPIRV_TOOLS_BUILD_VERSION_INC}
    COMMAND ${PYTHON_EXECUTABLE}
            ${SPIRV_TOOLS_BUILD_VERSION_INC_GENERATOR}
            ${CMAKE_SOURCE_DIR}/project/spirv-tools
			${SPIRV_TOOLS_BUILD_VERSION_INC}
    DEPENDS ${SPIRV_TOOLS_BUILD_VERSION_INC_GENERATOR}
            ${SPIRV_TOOLS_CHANGES_FILE}
    COMMENT "Update build-version.inc in the SPIRV-Tools build directory (if necessary).")
list(APPEND SPIRV_TOOL_DEPENDS ${SPIRV_TOOL_TARGET})
add_custom_target(${SPIRV_TOOL_TARGET} DEPENDS ${SPIRV_TOOLS_BUILD_VERSION_INC})
	 
set_source_files_properties(
    ${CMAKE_SOURCE_DIR}/project/spirv-tools/software_version.cpp
    PROPERTIES OBJECT_DEPENDS "${SPIRV_TOOLS_BUILD_VERSION_INC}")
