#version 330

uniform float u_time;
uniform sampler2D u_texture;
in vec2 v_texcoord;
out vec4 fragColor;

float rand(vec2 co) {
    return fract(sin(dot(co.xy, vec2(12.9898, 78.233))) * 43758.5453;
}

void main() {
    vec4 color = texture(u_texture, v_texcoord);
    float grain = rand(v_texcoord + u_time) * 0.1;
    fragColor = color + vec4(grain, grain, grain, 0.0);
}