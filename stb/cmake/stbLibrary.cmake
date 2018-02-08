
file(WRITE  project/stb.c "")
file(APPEND project/stb.c "#include <stb.h>\n")
file(APPEND project/stb.c "#include <stb_c_lexer.h>\n")
file(APPEND project/stb.c "#include <stb_image.h>\n")
file(APPEND project/stb.c "#include <stb_image_resize.h>\n")
file(APPEND project/stb.c "#include <stb_image_write.h>\n")
file(APPEND project/stb.c "#include <stb_easy_font.h>\n")
file(APPEND project/stb.c "#include <stb_truetype.h>\n")
#file(APPEND project/stb.c "#include <stb_connected_components.h>\n")
#file(APPEND project/stb.c "#include <stb_divide.h>\n")
#file(APPEND project/stb.c "#include <stb_dxt.h>\n")
#file(APPEND project/stb.c "#include <stb_herringbone_wang_tile.h>\n")
#file(APPEND project/stb.c "#include <stb_leakcheck.h>\n")
#file(APPEND project/stb.c "#include <stb_perlin.h>\n")
#file(APPEND project/stb.c "#include <stb_rect_pack.h>\n")
#file(APPEND project/stb.c "#include <stb_sprintf.h>\n")
#file(APPEND project/stb.c "#include <stb_textedit.h>\n")
#file(APPEND project/stb.c "#include <stb_tilemap_editor.h>\n")
#file(APPEND project/stb.c "#include <stb_voxel_render.h>\n")

set(HEADERS_PUBLIC
    project/stb.h
    project/stb_c_lexer.h
	project/stb_easy_font.h
	project/stb_image.h
    project/stb_image_resize.h
    project/stb_image_write.h
	project/stb_truetype.h
    #project/stb_connected_components.h	
    #project/stb_divide.h
    #project/stb_dxt.h    
    #project/stb_herringbone_wang_tile.h    
    #project/stb_leakcheck.h
    #project/stb_perlin.h
    #project/stb_rect_pack.h
    #project/stb_sprintf.h
    #project/stb_textedit.h
    #project/stb_tilemap_editor.h
    #project/stb_voxel_render.h
)

set(SOURCES_PRIVATE
	project/stb.c
    project/stb_vorbis.c
)