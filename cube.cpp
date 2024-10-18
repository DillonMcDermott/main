#include <GL/glew.h>

#ifdef __APPLE_CC__
#include <GLUT/glut.h>
#else
#include <GL/glut.h>
#endif

#include <iostream>
#include <sstream>
#include <fstream>

using namespace std;

// Vector class for easier handling of 3D vertices
class Vector {
public:
    float x_, y_, z_;
    Vector(float x = 0, float y = 0, float z = 0) : x_(x), y_(y), z_(z) {}
    float x() const { return x_; }
    float y() const { return y_; }
    float z() const { return z_; }
};

// Add a triangle between three vertices
void addTriangle(Vector a, Vector b, Vector c, Vector color) {
    glBegin(GL_TRIANGLES);
        glColor3f(color.x(), color.y(), color.z());
        glVertex3f(a.x(), a.y(), a.z());
        glVertex3f(b.x(), b.y(), b.z());
        glVertex3f(c.x(), c.y(), c.z());
    glEnd();
}

// Function to add a surface using four vertices
void addSurface(Vector a, Vector b, Vector c, Vector d) {
    Vector gray(0.5, 0.5, 0.5);  // Surface color (gray)
    addTriangle(a, b, d, gray);  // First triangle
    addTriangle(b, c, d, gray);  // Second triangle
}

// Function to add a cube by specifying its size
void addCube(float r) {
    // Define cube's vertices for each face
    Vector a(-r, -r, -r);
    Vector b(-r, r, -r);
    Vector c(r, -r, -r);
    Vector d(r, r, -r);

    // Front face
    addSurface(a, b, c, d);

    // Back face
    a = Vector(-r, -r, r);
    b = Vector(-r, r, r);
    c = Vector(r, -r, r);
    d = Vector(r, r, r);
    addSurface(a, b, c, d);

    // Right face
    a = Vector(r, -r, r);
    b = Vector(r, r, r);
    c = Vector(r, -r, -r);
    d = Vector(r, r, -r);
    addSurface(a, b, c, d);

    // Left face
    a = Vector(-r, -r, r);
    b = Vector(-r, r, r);
    c = Vector(-r, -r, -r);
    d = Vector(-r, r, -r);
    addSurface(a, b, c, d);

    // Top face
    a = Vector(-r, r, r);
    b = Vector(r, r, r);
    c = Vector(-r, r, -r);
    d = Vector(r, r, -r);
    addSurface(a, b, c, d);

    // Bottom face
    a = Vector(-r, -r, r);
    b = Vector(r, -r, r);
    c = Vector(-r, -r, -r);
    d = Vector(r, -r, -r);
    addSurface(a, b, c, d);
}

// Display function to render the cube
void display() {
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

    addCube(0.5);

    glFlush();
}

int main(int argc, char** argv) {
    glutInit(&argc, argv);

    glutInitDisplayMode(GLUT_SINGLE | GLUT_RGB | GLUT_DEPTH);

    glutInitWindowPosition(80, 80);
    glutInitWindowSize(400, 300);
    glutCreateWindow("3D Cube");

    GLenum err = glewInit();
    if (err != GLEW_OK)
        exit(1);

    glEnable(GL_DEPTH_TEST);
    glutDisplayFunc(display);

    glutMainLoop();

    return 0;
}
