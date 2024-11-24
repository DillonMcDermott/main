#version 120

varying vec3 vPosition;

void main() {
  gl_FragColor = vec4(abs(vPosition), 1.0); // Color based on vertex position
}
