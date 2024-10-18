#version 120

// Uniform variable
uniform mat4 viewMat;

// Attributes for vertex position, color, and normal
attribute vec3 aPos;     // Vertex position
attribute vec3 Color;    // Vertex color
attribute vec3 aNormal;  // Vertex normal

// Varying variables to pass data to the fragment shader
varying vec3 fPos;       // Fragment position
varying vec3 fNormal;    // Fragment normal
varying vec3 fColor;     // Fragment color

void main() {
    fPos = aPos;   
    fNormal = aNormal;
    fColor = Color;
    gl_Position = viewMat * vec4(aPos, 1.0);
}
