#!/usr/bin/env python3.6
import sys
sys.path.append("..")
from _scripts import *

git_desc = "GLI - C++ utilities"
git_repo = "g-truc/gli"
git_tag  = "0.8.2.0"

message(git_desc)
downloadGit(git_repo, git_tag)
configure()
install()
