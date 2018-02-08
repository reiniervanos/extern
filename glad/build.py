#!/usr/bin/env python3.6
import sys
sys.path.append("..")
from _scripts import *

git_desc = "GLAD - Multi-Language GL/GLES/EGL/GLX/WGL Loader-Generator"
git_repo = "Dav1dde/glad"
git_tag  = "v0.1.16a0"


def generate():
	sys.path.append("project")
	from glad.__main__ import main
	sys.argv = [sys.argv[0], "--generator=c", "--out-path=project", "--spec=gl", "--api=gles2=3.2"]
	main()
	sys.argv = [sys.argv[0], "--generator=c", "--out-path=project", "--spec=wgl", "--api=wgl=1.0"]
	main()
	sys.argv = [sys.argv[0], "--generator=c", "--out-path=project", "--spec=egl", "--api=egl=1.4"]
	main()

message(git_desc)
downloadGit(git_repo, git_tag)
generate()
configure()
install()
