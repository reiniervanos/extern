
set(HEADERS_PUBLIC
    project/include/GLFW/glfw3.h
    project/include/GLFW/glfw3native.h
)

set(HEADERS_COMMON 
    project/src/internal.h
    project/src/glfw_config.h
)
    
set(SOURCES_COMMON 
    project/src/context.c 
    project/src/init.c 
    project/src/input.c 
    project/src/monitor.c 
    project/src/vulkan.c 
    project/src/window.c
)

if (_GLFW_WIN32)
    set(HEADERS_PLATFORM 
		${HEADERS_PUBLIC}
        ${HEADERS_COMMON} 
        project/src/win32_platform.h 
        project/src/win32_joystick.h
        project/src/wgl_context.h 
        project/src/egl_context.h
	)
        
    set(SOURCE_PLATFORM 
        ${SOURCES_COMMON} 
        project/src/win32_init.c 
        project/src/win32_joystick.c
        project/src/win32_monitor.c 
        project/src/win32_time.c 
        project/src/win32_tls.c 
        project/src/win32_window.c
        project/src/wgl_context.c 
        project/src/egl_context.c
	)
                     
elseif (_GLFW_WAYLAND)
    set(HEADERS_PLATFORM
		${HEADERS_PUBLIC}
        ${HEADERS_COMMON} 
        project/src/wl_platform.h 
        project/src/linux_joystick.h
        project/src/posix_time.h 
        project/src/posix_tls.h 
        project/src/xkb_unicode.h 
        project/src/egl_context.h
	)
        
    set(SOURCE_PLATFORM 
        ${SOURCES_COMMON} 
        project/src/wl_init.c 
        project/src/wl_monitor.c 
        project/src/wl_window.c
        project/src/linux_joystick.c 
        project/src/posix_time.c 
        project/src/posix_tls.c 
        project/src/xkb_unicode.c
        project/src/egl_context.c
	)

    ecm_add_wayland_client_protocol(SOURCE_PLATFORM PROTOCOL
        ${WAYLAND_PROTOCOLS_PKGDATADIR}/unstable/relative-pointer/relative-pointer-unstable-v1.xml
        BASENAME relative-pointer-unstable-v1)
        
    ecm_add_wayland_client_protocol(SOURCE_PLATFORM PROTOCOL
        ${WAYLAND_PROTOCOLS_PKGDATADIR}/unstable/pointer-constraints/pointer-constraints-unstable-v1.xml
        BASENAME pointer-constraints-unstable-v1)
endif()