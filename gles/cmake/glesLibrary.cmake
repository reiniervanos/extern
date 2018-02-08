
file(WRITE api/include/GLES3/gl3ext.h "#include <GLES2/gl2ext.h>" )

set(HEADERS_PUBLIC_GLES2
    api/include/GLES3/gl2ext.h
)

set(HEADERS_PUBLIC_GLES3
    api/include/GLES3/gl3.h
    api/include/GLES3/gl31.h
    api/include/GLES3/gl32.h
    api/include/GLES3/gl3ext.h
    api/include/GLES3/gl3platform.h
)