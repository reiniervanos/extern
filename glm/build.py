#!/usr/bin/env python3.6
import sys
sys.path.append("..")
from _scripts import *

git_desc = "GLM - OpenGL Mathematics"
git_repo = "g-truc/glm"
git_tag  = "0.9.8.5"

message(git_desc)
downloadGit(git_repo, git_tag)
configure()
install()
