# ENVIRONMENT
- EXTERN_ARCHITECTURE
- EXTERN_ANDROID_ARCH
- EXTERN_GENERATOR
- EXTERN_PLATFORM
- EXTERN_ROOT

# LINUX
```bash
$ sudo apt-get install libgl1-mesa-dev  

$ sudo apt-get install wayland-protocols  

$ sudo apt-get install libxkbcommon-dev
  
$ git clone git://anongit.kde.org/extra-cmake-modules  
$ mkdir extra-cmake-modules/build && cd extra-cmake-modules/build  
$ cmake .. && make && sudo make install  
```

# PREREQUISITES

## Vulkan 1.0.65
LunarG Vulkan SDK
### Provides
- vulkan.h,  vulkan.hpp
- VKstatic.1.lib
- vulkan-1.lib
- vulkan-1.pdb
- vulkan-1.dll

# IMPLEMENTED

## egl 1.5
Khronos EGL

## getopt
GNU-style commandline parsing  

## glad 0.1.16
Multi-Language GL/GLES/EGL/GLX/WGL Loader-Generator

## gles 3.2
Khronos OpenGL-ES

## gli 0.8.2.0
OpenGL Image

## glfw 3.2.1
A multi-platform library for OpenGL, OpenGL ES, Vulkan, window and input
### Dependencies
egl  
gles  
vulkan  

## glm 0.9.8
OpenGL Mathematics

## ktx
KhronosGroup OpenGL Textures

## shaderc
Library for compiling shader strings into SPIR-V
### Provides
- spirv-headers
- spirv-tools
- glglang
- shaderc

## stb
stb single-file public domain libraries for C/C++  
### Library
stb_image.h         - 2.16 - image loading/decoding from file/memory: JPG, PNG, TGA, BMP, PSD, GIF, HDR, PIC  
stb_image_write.h   - 1.07 - image writing to disk: PNG, TGA, BMP  
stb_image_resize.h  - 0.95 - resize images larger/smaller with good quality  
stb_truetype.h      - 1.17 - parse, decode, and rasterize characters from truetype fonts  
stb_easy_font.h     - 1.0  - quick-and-dirty easy-to-deploy bitmap font for printing frame rate, etc  
stb_dxt.h           - 1.07 - Fabian "ryg" Giesen's real-time DXT compressor  
stb_c_lexer.h       - 0.09 - simplify writing parsers for C-like languages  
stb_leakcheck.h     - 0.4  - quick-and-dirty malloc/free leak-checking  

## zlib 1.2.11
A massively spiffy yet delicately unobtrusive compression library  
