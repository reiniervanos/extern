#!/usr/bin/env python3.6
import sys
sys.path.append("..")
from _scripts import *

desc = "EGL - EGL 1.5 headers"

files_egl = [
	"https://www.khronos.org/registry/EGL/api/EGL/egl.h",
	"https://www.khronos.org/registry/EGL/api/EGL/eglext.h",
	"https://www.khronos.org/registry/EGL/api/EGL/eglplatform.h" ]

files_khr = [
	"https://www.khronos.org/registry/EGL/api/KHR/khrplatform.h" ]

files_doc = [
	"https://www.khronos.org/registry/EGL/specs/eglspec.1.5.pdf" ]


message(desc)

for file in files_egl:	downloadFile(file, "api/include/EGL/" + os.path.basename(file))
for file in files_khr:	downloadFile(file, "api/include/KHR/" + os.path.basename(file))
for file in files_doc:	downloadFile(file, "doc/"             + os.path.basename(file))

configure()
install()
