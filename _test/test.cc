#include <cstdint>
#include <cstdlib>
#include <cstdio>

#include "zlib.h"


static void error_callback(int error, const char* description) {
    fprintf(stderr, "Error: %s\n", description);
}


int main(int argc, char* argv[]) {
	
	// zlib
	z_stream defstream{};
	deflateInit(&defstream, Z_BEST_COMPRESSION);
	
#if 0
	// glfw
	GLFWwindow* window;	
	glfwSetErrorCallback(error_callback);	
	if (!glfwInit()) {
        exit(EXIT_FAILURE);
	}
	
	glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
    glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 0);
	
	window = glfwCreateWindow(640, 480, "Simple example", nullptr, nullptr);
    if (!window) {
        glfwTerminate();
        exit(EXIT_FAILURE);
    }
	
	glfwMakeContextCurrent(window);
    glfwSwapInterval(1);
	
	// glew
	if (glewInit() != GLEW_OK) {
		fprintf(stderr, "glewInit failed\n");
	}
	
	int width, height;
	while (!glfwWindowShouldClose(window)) {
		glfwGetFramebufferSize(window, &width, &height);
        float ratio = (float)width / (float)height;
		
		glClearColor(1.0f, 0.0f, 0.0f, 0.0f);
		glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
				
		glfwSwapBuffers(window);
        glfwPollEvents();
	}
	
	glfwDestroyWindow(window);
    glfwTerminate();
#endif
	
    exit(EXIT_SUCCESS);
}