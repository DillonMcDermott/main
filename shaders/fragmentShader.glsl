varying vec3 vPosition;
varying vec3 vNormal;
varying vec3 vLightDirection;

void main() {
  // Normalize the light direction and normal vector
  vec3 lightDir = normalize(vLightDirection);
  vec3 normal = normalize(vNormal);

  // Calculate the dot product between the light direction and the normal
  float diff = max(dot(normal, lightDir), 0.0);  // Diffuse lighting

  // Assign different colors for each face of the cube
  vec4 color;
  
  // Determine color based on the normal (which face of the cube it is)
  if (abs(normal.x) > abs(normal.y) && abs(normal.x) > abs(normal.z)) {
    // X axis face
    if (normal.x > 0.0) {
      color = vec4(1.0, 0.0, 0.0, 1.0); // Red for +X face
    } else {
      color = vec4(0.0, 1.0, 0.0, 1.0); // Green for -X face
    }
  } else if (abs(normal.y) > abs(normal.x) && abs(normal.y) > abs(normal.z)) {
    // Y axis face
    if (normal.y > 0.0) {
      color = vec4(0.0, 0.0, 1.0, 1.0); // Blue for +Y face
    } else {
      color = vec4(1.0, 1.0, 0.0, 1.0); // Yellow for -Y face
    }
  } else {
    // Z axis face
    if (normal.z > 0.0) {
      color = vec4(1.0, 0.0, 1.0, 1.0); // Magenta for +Z face
    } else {
      color = vec4(0.0, 1.0, 1.0, 1.0); // Cyan for -Z face
    }
  }

  // Apply the diffuse lighting factor (darkens or brightens based on the light)
  gl_FragColor = color * diff;  // Multiply the color by the lighting intensity
}
