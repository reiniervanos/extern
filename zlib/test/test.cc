#include "zlib.h"

#include <cstdio>
#include <cstring>
#include <cstdlib>


#define CHECK_ERR(err, msg) { \
    if (err != Z_OK) { \
        fprintf(stderr, "%s error: %d\n", msg, err); \
        exit(1); \
    } \
}

static z_const char hello[] = "hello, hello!";


void test_deflate(Byte *compr, uLong comprLen) {
    int err;
    uLong len = (uLong)strlen(hello)+1;

    z_stream c_stream{};	
    err = deflateInit(&c_stream, Z_DEFAULT_COMPRESSION);
    CHECK_ERR(err, "deflateInit");

    c_stream.next_in  = (z_const unsigned char *)hello;
    c_stream.next_out = compr;

    while (c_stream.total_in != len && c_stream.total_out < comprLen) {
        c_stream.avail_in = c_stream.avail_out = 1; /* force small buffers */
        err = deflate(&c_stream, Z_NO_FLUSH);
        CHECK_ERR(err, "deflate");
    }
    
    for (;;) {
        c_stream.avail_out = 1;
        err = deflate(&c_stream, Z_FINISH);
        if (err == Z_STREAM_END) break;
        CHECK_ERR(err, "deflate");
    }

    err = deflateEnd(&c_stream);
    CHECK_ERR(err, "deflateEnd");
	
	printf("deflate(): %s\n", (char *)hello);
}


void test_inflate(Byte *compr, uLong comprLen, Byte *uncompr, uLong uncomprLen) {
    int err;
    strcpy((char*)uncompr, "garbage");

	z_stream d_stream{};
    d_stream.next_in  = compr;
    d_stream.avail_in = 0;
    d_stream.next_out = uncompr;

    err = inflateInit(&d_stream);
    CHECK_ERR(err, "inflateInit");

    while (d_stream.total_out < uncomprLen && d_stream.total_in < comprLen) {
        d_stream.avail_in = d_stream.avail_out = 1; 
        err = inflate(&d_stream, Z_NO_FLUSH);
        if (err == Z_STREAM_END) break;
        CHECK_ERR(err, "inflate");
    }

    err = inflateEnd(&d_stream);
    CHECK_ERR(err, "inflateEnd");

    if (strcmp((char*)uncompr, hello)) {
        fprintf(stderr, "bad inflate\n");
        exit(1);
    } else {
        printf("inflate(): %s\n", (char *)uncompr);
    }
}


int main(int argc, char* argv[]) {

	uLong comprLen = 10000*sizeof(int);
    Byte *compr    = (Byte*)calloc((uInt)comprLen, 1);
	test_deflate(compr, comprLen);	
	
	uLong uncomprLen = comprLen;
    Byte *uncompr  = (Byte*)calloc((uInt)uncomprLen, 1);
    test_inflate(compr, comprLen, uncompr, uncomprLen);

    free(compr);
    free(uncompr);
	
    return 0;
}
