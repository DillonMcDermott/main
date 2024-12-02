varying vec3 vPosition;
varying vec3 vNormal;
varying vec3 vLightDirection;

void main() {
  // Normalize the light direction and normal vector
  vec3 lightDir = normalize(vLightDirection);
  vec3 normal = normalize(vNormal);

  // Calculate the dot product between the light direction and the normal
  float diff = max(dot(normal, lightDir), 0.0);

  vec4 color;
  
  // Determine color based on the cube face
  if (abs(normal.x) > abs(normal.y) && abs(normal.x) > abs(normal.z)) {
    // X axis
    if (normal.x > 0.0) {
      color = vec4(1.0, 0.0, 0.0, 1.0); // Red
    } else {
      color = vec4(0.0, 1.0, 0.0, 1.0); // Green
    }
  } else if (abs(normal.y) > abs(normal.x) && abs(normal.y) > abs(normal.z)) {
    // Y axis
    if (normal.y > 0.0) {
      color = vec4(0.0, 0.0, 1.0, 1.0); // Blue
    } else {
      color = vec4(1.0, 1.0, 0.0, 1.0); // Yellow
    }
  } else {
    // Z axis
    if (normal.z > 0.0) {
      color = vec4(1.0, 0.0, 1.0, 1.0); // Magenta
    } else {
      color = vec4(0.0, 1.0, 1.0, 1.0); // Cyan
    }
  }

  // Darkens or brightens based on the light
  gl_FragColor = color * diff;  // Multiply the color by the lighting intensity
}
