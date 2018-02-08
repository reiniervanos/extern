#!/usr/bin/env python3.6
import sys
sys.path.append("..")
from _scripts import *

git_desc = "GLFW - A multi-platform library for OpenGL, OpenGL ES, Vulkan, window and input"
git_repo = "glfw/glfw"
git_tag  = "3.2.1"

message(git_desc)
downloadGit(git_repo, git_tag)
patch("CMake/modules/FindVulkan.cmake", "/Bin", "/Lib")
configure()
install()
