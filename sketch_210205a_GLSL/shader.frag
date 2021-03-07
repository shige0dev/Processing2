#ifdef GL_ES
precision mediump float;
#endif

// glslsandbox uniforms
uniform float time;
uniform vec2 resolution;

out vec4 fragColor;

void mail(){
   vec4 color = vec4(1, 0, 0, 1);
    fragColor = TDOutputSwizzle(color);
}