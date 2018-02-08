
add_definitions(-DAMD_EXTENSIONS)
add_definitions(-DNV_EXTENSIONS)
add_definitions(-DAMD_EXTENSIONS)

if(ANDROID OR UNIX)
  add_definitions(-DGLSLANG_OSINCLUDE_UNIX)
elseif(WIN32)
  add_definitions(-DGLSLANG_OSINCLUDE_WIN32)
endif()

set(HEADERS_PUBLIC_PUBLIC
    project/glslang/glslang/Public/ShaderLang.h
)

set(HEADERS_PUBLIC_INCLUDE
    project/glslang/glslang/Include/arrays.h
    project/glslang/glslang/Include/BaseTypes.h
    project/glslang/glslang/Include/Common.h
    project/glslang/glslang/Include/ConstantUnion.h
    project/glslang/glslang/Include/InfoSink.h
    project/glslang/glslang/Include/InitializeGlobals.h
    project/glslang/glslang/Include/intermediate.h
    project/glslang/glslang/Include/PoolAlloc.h
    project/glslang/glslang/Include/ResourceLimits.h
    project/glslang/glslang/Include/revision.h
    project/glslang/glslang/Include/ShHandle.h
    project/glslang/glslang/Include/Types.h	
)

set(HEADERS_PUBLIC_INDEPEND
    project/glslang/glslang/MachineIndependent/Versions.h
)

set(HEADERS_PUBLIC_SPIRV
    project/glslang/SPIRV/spirv.hpp
    project/glslang/SPIRV/GlslangToSpv.h
    project/glslang/SPIRV/Logger.h
)

set(HEADERS_PUBLIC
	${HEADERS_PUBLIC_PUBLIC}
	${HEADERS_PUBLIC_INCLUDE}
	${HEADERS_PUBLIC_INDEPEND}
	${HEADERS_PUBLIC_SPIRV}
)
    
set(HEADERS_PRIVATE
    project/glslang/glslang/MachineIndependent/glslang_tab.cpp.h
    project/glslang/glslang/MachineIndependent/gl_types.h
    project/glslang/glslang/MachineIndependent/Initialize.h
    project/glslang/glslang/MachineIndependent/iomapper.h
    project/glslang/glslang/MachineIndependent/LiveTraverser.h
    project/glslang/glslang/MachineIndependent/localintermediate.h
    project/glslang/glslang/MachineIndependent/ParseHelper.h
    project/glslang/glslang/MachineIndependent/reflection.h
    project/glslang/glslang/MachineIndependent/RemoveTree.h
    project/glslang/glslang/MachineIndependent/Scan.h
    project/glslang/glslang/MachineIndependent/ScanContext.h
    project/glslang/glslang/MachineIndependent/SymbolTable.h
    project/glslang/glslang/MachineIndependent/parseVersions.h
    project/glslang/glslang/MachineIndependent/propagateNoContraction.h
    project/glslang/glslang/MachineIndependent/preprocessor/PpContext.h
    project/glslang/glslang/MachineIndependent/preprocessor/PpTokens.h
    # spirv
    project/glslang/SPIRV/GLSL.std.450.h
    project/glslang/SPIRV/GLSL.ext.KHR.h
    project/glslang/SPIRV/GLSL.ext.AMD.h
    project/glslang/SPIRV/GLSL.ext.NV.h
    project/glslang/SPIRV/spvIR.h
    project/glslang/SPIRV/SpvBuilder.h
    project/glslang/SPIRV/SPVRemapper.h
    project/glslang/SPIRV/disassemble.h
    project/glslang/SPIRV/doc.h    
    project/glslang/SPIRV/bitutils.h
    project/glslang/SPIRV/hex_float.h	
)


if(WIN32)
    set(SOURCES_PRIVATE_PLATFORM project/glslang/glslang/OSDependent/Windows/ossource.cpp)
elseif(UNIX)
    set(SOURCES_PRIVATE_PLATFORM project/glslang/glslang/OSDependent/Unix/ossource.cpp)
endif()

set(SOURCES_PRIVATE
	${SOURCES_PRIVATE_PLATFORM}
    project/glslang/glslang/MachineIndependent/glslang.y
    project/glslang/glslang/MachineIndependent/glslang_tab.cpp
    project/glslang/glslang/MachineIndependent/Constant.cpp
    project/glslang/glslang/MachineIndependent/iomapper.cpp
    project/glslang/glslang/MachineIndependent/InfoSink.cpp
    project/glslang/glslang/MachineIndependent/Initialize.cpp
    project/glslang/glslang/MachineIndependent/IntermTraverse.cpp
    project/glslang/glslang/MachineIndependent/Intermediate.cpp
    project/glslang/glslang/MachineIndependent/ParseContextBase.cpp
    project/glslang/glslang/MachineIndependent/ParseHelper.cpp
    project/glslang/glslang/MachineIndependent/PoolAlloc.cpp
    project/glslang/glslang/MachineIndependent/RemoveTree.cpp
    project/glslang/glslang/MachineIndependent/Scan.cpp
    project/glslang/glslang/MachineIndependent/ShaderLang.cpp
    project/glslang/glslang/MachineIndependent/SymbolTable.cpp
    project/glslang/glslang/MachineIndependent/Versions.cpp
    project/glslang/glslang/MachineIndependent/intermOut.cpp
    project/glslang/glslang/MachineIndependent/limits.cpp
    project/glslang/glslang/MachineIndependent/linkValidate.cpp
    project/glslang/glslang/MachineIndependent/parseConst.cpp
    project/glslang/glslang/MachineIndependent/reflection.cpp
    project/glslang/glslang/MachineIndependent/preprocessor/Pp.cpp
    project/glslang/glslang/MachineIndependent/preprocessor/PpAtom.cpp
    project/glslang/glslang/MachineIndependent/preprocessor/PpContext.cpp
    project/glslang/glslang/MachineIndependent/preprocessor/PpScanner.cpp
    project/glslang/glslang/MachineIndependent/preprocessor/PpTokens.cpp
    project/glslang/glslang/MachineIndependent/propagateNoContraction.cpp
    project/glslang/glslang/GenericCodeGen/CodeGen.cpp
    project/glslang/glslang/GenericCodeGen/Link.cpp
    # spirv
    project/glslang/SPIRV/GlslangToSpv.cpp
    project/glslang/SPIRV/InReadableOrder.cpp
    project/glslang/SPIRV/Logger.cpp
    project/glslang/SPIRV/SpvBuilder.cpp
    project/glslang/SPIRV/disassemble.cpp
    project/glslang/SPIRV/SPVRemapper.cpp
    project/glslang/SPIRV/doc.cpp
)
