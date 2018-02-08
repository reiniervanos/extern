
set(HEADERS_PUBLIC
    project/include/ktx.h
)

set(HEADERS_PRIVATE
    project/lib/gl_funcptrs.h
    project/lib/gles1_funcptrs.h
    project/lib/gles2_funcptrs.h
    project/lib/gles3_funcptrs.h
    project/lib/ktxfilestream.h
    project/lib/ktxint.h
    project/lib/ktxmemstream.h
    project/lib/ktxstream.h
    project/lib/uthash.h
)

set(SOURCES_PRIVATE
    project/lib/checkheader.c
    project/lib/errstr.c
    project/lib/etcdec.cxx
    project/lib/etcunpack.cxx
    project/lib/hashtable.c
    project/lib/ktxfilestream.c
    project/lib/ktxmemstream.c
    project/lib/loader.c
    project/lib/swap.c
    project/lib/writer.c
)