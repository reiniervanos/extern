
set(HEADERS_PUBLIC
    project/zconf.h
    project/zlib.h
)

set(HEADERS_PRIVATE
    project/crc32.h
    project/deflate.h
    project/gzguts.h
    project/inffast.h
    project/inffixed.h
    project/inflate.h
    project/inftrees.h
    project/trees.h
    project/zutil.h
)

set(SOURCES_PRIVATE
    project/adler32.c
    project/compress.c
    project/crc32.c
    project/deflate.c
    project/gzclose.c
    project/gzlib.c
    project/gzread.c
    project/gzwrite.c
    project/inflate.c
    project/infback.c
    project/inftrees.c
    project/inffast.c
    project/trees.c
    project/uncompr.c
    project/zutil.c
)
