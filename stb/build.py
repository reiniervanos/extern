#!/usr/bin/env python3.6
import sys
sys.path.append("..")
from _scripts import *

git_desc = "STB - C++ utilities"
git_repo = "nothings/stb"
git_tag  = "master"

message(git_desc)
downloadGit(git_repo, git_tag)
configure()
install()
