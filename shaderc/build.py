#!/usr/bin/env python3.6
import sys
sys.path.append("..")
from _scripts import *

git_desc = "SHADERC - Shader compilation tools"
git_repo = "google/shaderc"
git_tag  = "master"

message(git_desc)
downloadGit(git_repo, git_tag, "/shaderc")
configure()
install()
