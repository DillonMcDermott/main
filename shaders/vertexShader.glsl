varying vec3 vPosition;
varying vec3 vNormal;
varying vec3 vLightDirection;

uniform vec3 lightPosition;

void main() {
  vPosition = position;
  vNormal = normalize(normal);

  // Calculate light direction in camera space
  vec4 viewPosition = modelViewMatrix * vec4(position, 1.0);
  vLightDirection = lightPosition - viewPosition.xyz;

  gl_Position = projectionMatrix * modelViewMatrix * vec4(position, 1.0);
}
