
if(ANDROID OR UNIX)
	set(HEADERS_EGL project/include/glad/glad_egl.h)
	set(SOURCES_EGL project/src/glad_egl.c)
else()
	set(HEADERS_WGL project/include/glad/glad_wgl.h)
	set(SOURCES_WGL project/src/glad_wgl.c)
endif()

set(HEADERS_PUBLIC
    project/include/glad/glad.h
	${HEADERS_EGL}
	${HEADERS_WGL}
)
	
set(HEADERS_KHRONOS
	project/include/KHR/khrplatform.h
)

set(SOURCES_PRIVATE
    project/src/glad.c
	${SOURCES_EGL}
	${SOURCES_WGL}
)