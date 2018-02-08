
set(SOURCES_MODULES "")

macro(assimp_add name)
    list(APPEND SOURCES_MODULES ${ARGN})
endmacro()

macro(assimp_ignore name)
    add_definitions(-DASSIMP_BUILD_NO_${name}_IMPORTER)
    add_definitions(-DASSIMP_BUILD_NO_${name}_EXPORTER)
endmacro()


set(HEADERS_PUBLIC_CORE
  ${CMAKE_BINARY_DIR}/project/include/assimp/config.h
  project/include/assimp/anim.h
  project/include/assimp/ai_assert.h
  project/include/assimp/camera.h
  project/include/assimp/color4.h
  project/include/assimp/color4.inl
  project/include/assimp/defs.h
  project/include/assimp/cfileio.h
  project/include/assimp/light.h
  project/include/assimp/material.h
  project/include/assimp/material.inl
  project/include/assimp/matrix3x3.h
  project/include/assimp/matrix3x3.inl
  project/include/assimp/matrix4x4.h
  project/include/assimp/matrix4x4.inl
  project/include/assimp/mesh.h
  project/include/assimp/postprocess.h
  project/include/assimp/quaternion.h
  project/include/assimp/quaternion.inl
  project/include/assimp/scene.h
  project/include/assimp/metadata.h
  project/include/assimp/texture.h
  project/include/assimp/types.h
  project/include/assimp/vector2.h
  project/include/assimp/vector2.inl
  project/include/assimp/vector3.h
  project/include/assimp/vector3.inl
  project/include/assimp/version.h
  project/include/assimp/cimport.h
  project/include/assimp/importerdesc.h
  project/include/assimp/Importer.hpp
  project/include/assimp/DefaultLogger.hpp
  project/include/assimp/ProgressHandler.hpp
  project/include/assimp/IOStream.hpp
  project/include/assimp/IOSystem.hpp
  project/include/assimp/Logger.hpp
  project/include/assimp/LogStream.hpp
  project/include/assimp/NullLogger.hpp
  project/include/assimp/cexport.h
  project/include/assimp/Exporter.hpp
  project/include/assimp/DefaultIOStream.h
  project/include/assimp/DefaultIOSystem.h
  project/include/assimp/SceneCombiner.h 
)

set(HEADERS_PUBLIC_COMPILER
  project/include/assimp/Compiler/pushpack1.h
  project/include/assimp/Compiler/poppack1.h
  project/include/assimp/Compiler/pstdint.h
)

set(HEADERS_PUBLIC
	${HEADERS_PUBLIC_CORE}
	${HEADERS_PUBLIC_COMPILER}
)

set(HEADERS_PRIVATE
	project/code/BaseImporter.h
	project/code/BaseProcess.h
	project/code/Bitmap.h
	project/code/ByteSwapper.h
	project/code/CInterfaceIOWrapper.h
	project/code/CreateAnimMesh.h
	project/code/DefaultProgressHandler.h
	project/code/fast_atof.h
	project/code/GenericProperty.h
	project/code/Hash.h
	project/code/IFF.h
	project/code/Importer.h
	project/code/IOStreamBuffer.h
	project/code/LineSplitter.h
	project/code/LogAux.h
	project/code/MemoryIOWrapper.h
	project/code/ParsingUtils.h
	project/code/Profiler.h
	project/code/qnan.h
	project/code/RemoveComments.h
	project/code/ScenePreprocessor.h
	project/code/ScenePrivate.h
	project/code/SGSpatialSort.h
	project/code/SkeletonMeshBuilder.h
	project/code/SmoothingGroups.h
	project/code/SpatialSort.h
	project/code/SplitByBoneCountProcess.h
	project/code/StandardShapes.h
	project/code/StreamReader.h
	project/code/StreamWriter.h
	project/code/StringComparison.h
	project/code/StringUtils.h
	project/code/Subdivision.h
	project/code/TargetAnimation.h
	project/code/TinyFormatter.h
	project/code/Vertex.h
	project/code/VertexTriangleAdjacency.h
	project/code/XMLTools.h
	# logger
	project/code/FileLogStream.h	
	project/code/StdOStreamLogStream.h	
	project/code/Win32DebugLogStream.h
	# post-process
	project/code/CalcTangentsProcess.h
	project/code/ComputeUVMappingProcess.h
	project/code/ConvertToLHProcess.h
	project/code/FindDegenerates.h
	project/code/FindInstancesProcess.h
	project/code/FindInvalidDataProcess.h
	project/code/FixNormalsStep.h
	project/code/GenFaceNormalsProcess.h
	project/code/GenVertexNormalsProcess.h
	project/code/PretransformVertices.h
	project/code/ImproveCacheLocality.h
	project/code/JoinVerticesProcess.h
	project/code/LimitBoneWeightsProcess.h
	project/code/RemoveRedundantMaterials.h
	project/code/RemoveVCProcess.h
	project/code/SortByPTypeProcess.h
	project/code/SplitLargeMeshes.h
	project/code/TextureTransform.h
	project/code/TriangulateProcess.h
	project/code/ValidateDataStructure.h
	project/code/OptimizeGraph.h
	project/code/OptimizeMeshes.h
	project/code/DeboneProcess.h
	project/code/ProcessHelper.h
	project/code/PolyTools.h
	project/code/MakeVerboseFormat.h
	# material
	project/code/MaterialSystem.h
)

set(SOURCES_PRIVATE
	project/code/Assimp.cpp
	project/code/BaseImporter.cpp
	project/code/BaseProcess.cpp
	project/code/Bitmap.cpp
	project/code/CInterfaceIOWrapper.cpp
	project/code/CreateAnimMesh.cpp
	project/code/DefaultIOStream.cpp
	project/code/DefaultIOSystem.cpp
	project/code/Importer.cpp
	project/code/ImporterRegistry.cpp
	project/code/PostStepRegistry.cpp
	project/code/RemoveComments.cpp
	project/code/scene.cpp
	project/code/SceneCombiner.cpp
	project/code/ScenePreprocessor.cpp
	project/code/SGSpatialSort.cpp
	project/code/SkeletonMeshBuilder.cpp
	project/code/SpatialSort.cpp
	project/code/SplitByBoneCountProcess.cpp
	project/code/StandardShapes.cpp
	project/code/Subdivision.cpp
	project/code/TargetAnimation.cpp
	project/code/Version.cpp
	project/code/VertexTriangleAdjacency.cpp	
	# logger
	project/code/DefaultLogger.cpp	
	# post-process	
	project/code/CalcTangentsProcess.cpp
	project/code/ComputeUVMappingProcess.cpp  
	project/code/ConvertToLHProcess.cpp  
	project/code/DeboneProcess.cpp  
	project/code/FindDegenerates.cpp  
	project/code/FindInstancesProcess.cpp  
	project/code/FindInvalidDataProcess.cpp  
	project/code/FixNormalsStep.cpp  
	project/code/GenFaceNormalsProcess.cpp  
	project/code/GenVertexNormalsProcess.cpp  
	project/code/ImproveCacheLocality.cpp
	project/code/JoinVerticesProcess.cpp  
	project/code/LimitBoneWeightsProcess.cpp  
	project/code/MakeVerboseFormat.cpp 
	project/code/OptimizeGraph.cpp  
	project/code/OptimizeMeshes.cpp  
	project/code/PretransformVertices.cpp  
	project/code/ProcessHelper.cpp  
	project/code/RemoveRedundantMaterials.cpp  
	project/code/RemoveVCProcess.cpp  
	project/code/SortByPTypeProcess.cpp  
	project/code/SplitLargeMeshes.cpp  
	project/code/TextureTransform.cpp  
	project/code/TriangulateProcess.cpp 
	project/code/ValidateDataStructure.cpp
	# material
	project/code/MaterialSystem.cpp
)


assimp_add(COLLADA
  project/code/ColladaHelper.h
  project/code/ColladaLoader.cpp
  project/code/ColladaLoader.h
  project/code/ColladaParser.cpp
  project/code/ColladaParser.h
  project/code/ColladaExporter.h
  project/code/ColladaExporter.cpp
)

assimp_add(OBJ
  project/code/ObjFileData.h
  project/code/ObjFileImporter.cpp
  project/code/ObjFileImporter.h
  project/code/ObjFileMtlImporter.cpp
  project/code/ObjFileMtlImporter.h
  project/code/ObjFileParser.cpp
  project/code/ObjFileParser.h
  project/code/ObjTools.h
  project/code/ObjExporter.h
  project/code/ObjExporter.cpp
)

assimp_add(PLY
  project/code/PlyLoader.cpp
  project/code/PlyLoader.h
  project/code/PlyParser.cpp
  project/code/PlyParser.h
  project/code/PlyExporter.cpp
  project/code/PlyExporter.h
)

assimp_add(FBX
  project/code/FBXImporter.cpp
  project/code/FBXCompileConfig.h
  project/code/FBXImporter.h
  project/code/FBXParser.cpp
  project/code/FBXParser.h
  project/code/FBXTokenizer.cpp
  project/code/FBXTokenizer.h
  project/code/FBXImportSettings.h
  project/code/FBXConverter.h
  project/code/FBXConverter.cpp
  project/code/FBXUtil.h
  project/code/FBXUtil.cpp
  project/code/FBXDocument.h
  project/code/FBXDocument.cpp
  project/code/FBXProperties.h
  project/code/FBXProperties.cpp
  project/code/FBXMeshGeometry.h
  project/code/FBXMeshGeometry.cpp
  project/code/FBXMaterial.cpp
  project/code/FBXModel.cpp
  project/code/FBXAnimation.cpp
  project/code/FBXNodeAttribute.cpp
  project/code/FBXDeformer.cpp
  project/code/FBXBinaryTokenizer.cpp
  project/code/FBXDocumentUtil.cpp
)

assimp_ignore(AMF)
assimp_ignore(3DS)
assimp_ignore(AC)
assimp_ignore(ASE)
assimp_ignore(ASSBIN)
assimp_ignore(ASSXML)
assimp_ignore(B3D)
assimp_ignore(BLEND)
assimp_ignore(BVH)
assimp_ignore(DXF)
assimp_ignore(CSM)
assimp_ignore(HMP)
assimp_ignore(IRR)
assimp_ignore(IRRMESH)
assimp_ignore(IRR)
assimp_ignore(LWO)
assimp_ignore(LWS)
assimp_ignore(MD2)
assimp_ignore(MD3)
assimp_ignore(MD5)
assimp_ignore(MDC)
assimp_ignore(MDL)
assimp_ignore(NFF)
assimp_ignore(NDO)
assimp_ignore(OFF)
assimp_ignore(OGRE)
assimp_ignore(OPENGEX)
assimp_ignore(MS3D)
assimp_ignore(COB)
assimp_ignore(IFC)
assimp_ignore(XGL)
assimp_ignore(Q3D)
assimp_ignore(Q3BSP)
assimp_ignore(RAW)
assimp_ignore(SIB)
assimp_ignore(SMD)
assimp_ignore(STL)
assimp_ignore(TERRAGEN)
assimp_ignore(3D)
assimp_ignore(X)
assimp_ignore(X3D)
assimp_ignore(GLTF)
assimp_ignore(3MF)
assimp_ignore(MMD)