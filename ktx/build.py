#!/usr/bin/env python3.6
import sys
sys.path.append("..")
from _scripts import *

git_desc = "KTX - Khronos Texture library"
git_repo = "KhronosGroup/KTX"
git_tag  = "final_v1_package"

message(git_desc)
downloadGit(git_repo, git_tag)
configure()
install()
