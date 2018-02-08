#!/usr/bin/env python3.6
import sys
sys.path.append("..")
from _scripts import *

lib_desc = "ZLIB - Compression library"
git_repo = "madler/zlib"
git_tag  = "v1.2.11"

message(lib_desc)
downloadGit(git_repo, git_tag)
configure()
install()
