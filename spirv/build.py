#!/usr/bin/env python3.6
import sys
sys.path.append("..")
from _scripts import *

git_desc  = "SPIRV - SPIRV headers & tools"
git_repo1 = "KhronosGroup/SPIRV-Headers"
git_repo2 = "KhronosGroup/SPIRV-Tools"
git_tag   = "master"

message(git_desc)
downloadGit(git_repo1, git_tag, "/spirv-headers")
downloadGit(git_repo2, git_tag, "/spirv-tools")
configure()
install()
