#!/usr/bin/env python3.6
import sys
sys.path.append("..")
from _scripts import *

desc = "GLES - OpenGL ES 3.2 headers"

files_gles2 = [
	"https://www.khronos.org/registry/OpenGL/api/GLES2/gl2ext.h" ]

files_gles3 = [
	"https://www.khronos.org/registry/OpenGL/api/GLES3/gl3.h",
	"https://www.khronos.org/registry/OpenGL/api/GLES3/gl31.h",
	"https://www.khronos.org/registry/OpenGL/api/GLES3/gl32.h",
	"https://www.khronos.org/registry/OpenGL/api/GLES3/gl3platform.h" ]

files_doc = [
	"https://www.khronos.org/registry/OpenGL/specs/es/3.0/es_spec_3.0.pdf",
	"https://www.khronos.org/registry/OpenGL/specs/es/3.1/es_spec_3.1.pdf",
	"https://www.khronos.org/registry/OpenGL/specs/es/3.2/es_spec_3.2.pdf",
	"https://www.khronos.org/registry/OpenGL/specs/es/3.0/GLSL_ES_Specification_3.00.pdf",
	"https://www.khronos.org/registry/OpenGL/specs/es/3.1/GLSL_ES_Specification_3.10.pdf",
	"https://www.khronos.org/registry/OpenGL/specs/es/3.2/GLSL_ES_Specification_3.20.pdf" ]


message(desc)

for file in files_gles2:	downloadFile(file, "api/include/GLES3/" + os.path.basename(file))
for file in files_gles3:	downloadFile(file, "api/include/GLES3/" + os.path.basename(file))
for file in files_doc:		downloadFile(file, "doc/"               + os.path.basename(file))

configure()
install()
