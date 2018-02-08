#!/usr/bin/env python3.6
import sys
sys.path.append("..")
from _scripts import *

lib_desc = "ASSIMP - Open Asset Import Library"
git_repo = "assimp/assimp"
git_tag  = "v4.0.1"

message(lib_desc)
downloadGit(git_repo, git_tag)
configure()
install()
