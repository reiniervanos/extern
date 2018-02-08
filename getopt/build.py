#!/usr/bin/env python3.6
import sys
sys.path.append("..")
from _scripts import *

git_desc = "GETOPT - GNU-style commandline parsing"
git_repo = "kimgr/getopt_port"
git_tag  = "master"

message(git_desc)
downloadGit(git_repo, git_tag)
configure()
install()
