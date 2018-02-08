#undef STBI_WRITE_NO_STDIO

#include "stb_image_write.h"
#include "stb_image.h"
#include "stb.h"

#include <cstdio>
#include <cassert>


void dummy_write(void *context, void *data, int len) {
	static char dummy[1024];
	if (len > 1024) len = 1024;
	memcpy(dummy, data, len);
}


int main(int argc, char* argv[]) {
	
	int i,n;
	int w,h;

	for (i=1; i < argc; ++i) {
		int res;
		int w2,h2,n2;
		unsigned char *data;
		printf("%s\n", argv[i]);
		res = stbi_info(argv[1], &w2, &h2, &n2);
		data = stbi_load(argv[i], &w, &h, &n, 4); if (data) free(data); else printf("Failed &n\n");
		data = stbi_load(argv[i], &w, &h,  0, 1); if (data) free(data); else printf("Failed 1\n");
		data = stbi_load(argv[i], &w, &h,  0, 2); if (data) free(data); else printf("Failed 2\n");
		data = stbi_load(argv[i], &w, &h,  0, 3); if (data) free(data); else printf("Failed 3\n");
		data = stbi_load(argv[i], &w, &h, &n, 4);
		assert(data);
		assert(w == w2 && h == h2 && n == n2);
		assert(res);
		assert(data);

		char fname[512];
		stb_splitpath(fname, argv[i], STB_FILE);
		stbi_write_png(stb_sprintf("output/%s.png", fname), w, h, 4, data, w*4);
		stbi_write_bmp(stb_sprintf("output/%s.bmp", fname), w, h, 4, data);
		stbi_write_tga(stb_sprintf("output/%s.tga", fname), w, h, 4, data);
		stbi_write_png_to_func(dummy_write,0, w, h, 4, data, w*4);
		stbi_write_bmp_to_func(dummy_write,0, w, h, 4, data);
		stbi_write_tga_to_func(dummy_write,0, w, h, 4, data);
		free(data);
	}
    return 0;
}
