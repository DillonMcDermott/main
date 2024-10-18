# Define paths for GLEW
GLEW_INCLUDE_DIR = /opt/homebrew/Cellar/glew/2.2.0_1/include
GLEW_LIB_DIR = /opt/homebrew/lib

# Compiler and flags
CC = clang++
CFLAGS = -I$(GLEW_INCLUDE_DIR) -std=c++17
LDFLAGS = -L$(GLEW_LIB_DIR) -lGLEW -stdlib=libc++

# Targets
all: cube

cube: cube.cpp
	$(CC) $(CFLAGS) cube.cpp -o cube $(LDFLAGS) -framework OpenGL -framework GLUT

run: cube
	./cube
