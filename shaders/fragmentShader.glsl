varying vec3 vPosition;
varying vec3 vNormal;
varying vec3 vLightDirection;

void main() {
  // Normalize the light direction and normal vector
  vec3 lightDir = normalize(vLightDirection);
  vec3 normal = normalize(vNormal);

  // Calculate dot product between light direction and normal
  float diff = max(dot(normal, lightDir), 0.0);  // Diffuse lighting

  // Use the diffuse factor to adjust the color
  vec4 color;

  if (diff > 0.0) {
    // Light side of the cube (show full color)
    color = vec4(abs(vPosition), 1.0); // Color based on position
  } else {
    // Dark side of the cube (no light)
    color = vec4(0.0, 0.0, 0.0, 1.0); // Black color for the dark side
  }

  gl_FragColor = color * diff;  // Apply lighting intensity (diffuse)
}
