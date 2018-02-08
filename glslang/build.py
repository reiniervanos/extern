#!/usr/bin/env python3.6
import sys
sys.path.append("..")
from _scripts import *

git_desc = "GLSLANG - GLSL Language tools"
git_repo = "KhronosGroup/glslang"
git_tag  = "master"

message(git_desc)
downloadGit(git_repo, git_tag, "/glslang")
configure()
install()
