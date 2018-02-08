#!/usr/bin/env python3.6

# EXTERN_ARCHITECTURE
# EXTERN_ANDROID_ARCH
# EXTERN_GENERATOR
# EXTERN_INSTALL
# EXTERN_ROOT

import os
import sys
import ssl
import urllib.request
import zipfile
import shutil
import platform
import subprocess


ssl._create_default_https_context = ssl._create_unverified_context


_force_android		= False
_force_android_arch	= None
_clean_config  		= True


def forceAndroid(android=True, android_arch=None):
	global _force_android
	global _force_android_arch
	_force_android = android
	if android_arch:
		_force_android_arch = android_arch


def isWindowsSystem():
	return ("Windows" == platform.system())


def isLinuxSystem():
	return ("Linux" == platform.system())


def isWindows():
	return (True if (not isAndroid() and isWindowsSystem()) else False)


def isLinux():
	return (True if (not isAndroid() and isLinuxSystem()) else False)


def isAndroid():
	global _force_android
	env = os.getenv("EXTERN_PLATFORM", "")
	is_android  = _force_android
	is_android |= ("android" == platform.system().lower())
	is_android |= ("android" == env.lower())
	return is_android


def getBuildFolder():
	if isAndroid(): return "android"
	else: 			return "build"


def getProjectFolder():
	return "project"


def mkdir(folder):
	if folder and not os.path.exists(folder):
		os.makedirs(folder)


def rmdir(folder):
	if os.path.exists(folder):
		shutil.rmtree(folder)


def execute(working_folder, command):
	try:
		mkdir(working_folder)
		cwd = os.getcwd()
		os.chdir(working_folder)
		os.system(command)
	finally:
		os.chdir(cwd)


def message(description):
	print("")
	print(description)
	print("------------------------------------------------------------")


def downloadFile(url, file_name):
	if not os.path.exists(file_name):
		folder = os.path.dirname(file_name)
		if not os.path.exists(folder):
			mkdir(folder)
		print(f"Downloading {url}")
		urllib.request.urlretrieve(url, file_name)


def downloadZip(zip_url, zip_name):
	if not os.path.exists(getProjectFolder()):
		downloadFile(zip_url, zip_name)
		print(f"Extract {zip_url}")
		zip = zipfile.ZipFile(zip_name)
		zip.extractall()
		zip.close()
		os.remove(zip_name)
		shutil.move(os.path.splitext(zip_name)[0], getProjectFolder())


def downloadGit(git_repo, git_tag, postfix=""):
	project_folder = getProjectFolder() + postfix
	if os.path.exists(project_folder):
		os.system(f"git -C \"{project_folder}\" pull \"https://github.com/{git_repo}\" \"{git_tag}\"")
	else:
		git_options = " -c advice.detachedHead=false --depth 1"
		os.system(f"git clone \"https://github.com/{git_repo}\" \"{project_folder}\" --branch \"{git_tag}\"")


def configureGenerator():
	if not isWindows():
		return ""
	env = os.getenv("EXTERN_GENERATOR", None)
	return (f" -G\"{env}\"" if env else "")


def configureArchitecture():
	if not isWindows():
		return ""
	env = os.getenv("EXTERN_ARCHITECTURE", None)
	return (f" -A\"{env}\"" if env else "")


def configureInstallPrefix():
	global _force_android_arch
	folder = None
	
	if isWindowsSystem():
		folder = os.getenv("USERPROFILE", None)
	elif isLinuxSystem():
		folder = os.path.expanduser("~")
	
	folder = os.path.normpath(folder).replace('\\', '/')
	folder += "/.extern"
	
	if isAndroid():
		android_arch = _force_android_arch if _force_android_arch else os.getenv("EXTERN_ANDROID_ARCH", "armv7-a")
		folder += f"/android/{android_arch}"
	else:
		env = os.getenv("EXTERN_ARCHITECTURE", None)
		folder += (f"/{env}" if env else "")
	
	return (f" -DCMAKE_INSTALL_PREFIX:PATH=\"{folder}\"")


def configureExternInstall():
	global _force_android_arch
	folder = None
	
	if isWindowsSystem():
		folder = os.getenv("USERPROFILE", None)
	elif isLinuxSystem():
		folder = os.path.expanduser("~")
	
	folder = os.path.normpath(folder).replace('\\', '/')
	folder += "/.extern"
	
	if isAndroid():
		android_arch = _force_android_arch if _force_android_arch else os.getenv("EXTERN_ANDROID_ARCH", "armv7-a")
		folder += f"/android/{android_arch}"
	else:
		env = os.getenv("EXTERN_ARCHITECTURE", None)
		folder += (f"/{env}" if env else "")
	
	return (f" -DEXTERN_INSTALL:PATH=\"{folder}\"")


def configureSystem():
	global _force_android_arch
	options = ""
	if isAndroid():
		android_arch = _force_android_arch if _force_android_arch else os.getenv("EXTERN_ANDROID_ARCH", "armv7-a")
		options += f" -DCMAKE_SYSTEM_NAME=\"Android\""
		options += f" -DCMAKE_ANDROID_ARCH=\"{android_arch}\""
		options += f" -DCMAKE_ANDROID_API_MIN=\"18\""
		options += f" -DCMAKE_ANDROID_API=\"23\""
		#options += f" -DCMAKE_ANDROID_NATIVE_LIB_DEPENDENCIES=\" \""
		#options += f" -DCMAKE_ANDROID_NATIVE_LIB_DIRECTORIES=\" \""
		#options += f" -DCMAKE_ANDROID_ASSETS_DIRECTORIES=\" \""
	return options;


def configure():
	if _clean_config:
		rmdir(getBuildFolder())
	options  = configureGenerator()
	options += configureArchitecture()
	options += configureInstallPrefix()
	options += configureSystem()
	execute(getBuildFolder(), f"cmake .. {options}")


def install():
	execute(getBuildFolder(), f"cmake --build . --target install --config Release")


def patch(file_name, old, new):
	print(f"Patching {file_name}")
	file_name = f"{getProjectFolder()}/{file_name}"
	with open(file_name) as file:
		content = file.read().replace(old, new)
	with open(file_name, "w") as file:
		file.write(content)


def test():
	options  = configureGenerator()
	options += configureArchitecture()
	options += configureExternInstall()
	options += configureSystem()
	execute(getBuildFolder(), f"cmake .. {options}")
	execute(getBuildFolder(), f"cmake --build . --config Release")
