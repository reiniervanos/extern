#!/usr/bin/env python3.6
import os
from _scripts import *

python_cmd = "/usr/bin/env python3.6" if isLinuxSystem() else ""


def install(library):
	current_directory = os.getcwd()
	library_directory = os.path.join(current_directory, library)
	try:
		os.chdir(library_directory)
		os.system(f"{python_cmd} build.py")
	finally:
		os.chdir(current_directory)


install("getopt")
install("zlib")
install("stb")
install("egl")
install("gles")
install("glad")
install("glm")
install("gli")
install("ktx")
install("spirv")
install("glslang")
install("shaderc")
install("assimp")

if not isAndroid():
	install("glfw")
