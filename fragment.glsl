#version 120
void main(){
    float v=90.0; //10 percent 0-100 -> 0.0 and 1.1

    vec4 c1=vec4(1.0,0.0,0.0,1.0);
    vec4 c2=vec4(0.0,1.0,1.0,1.0);

    vec4 m=mix(c1,c2,v/100.0);

  //  float i=clamp(m,0.0,1.0);

  //  gl_FragColor = vec4(0.0f, 1.0f, 0.5+0.5*i, 1.0f);
    gl_FragColor = m;
}
