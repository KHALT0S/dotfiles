#version 120
uniform sampler2D tex;
void main() {
    vec2 uv = gl_TexCoord[0].xy;
    vec4 color = texture2D(tex, uv);
    float noise = fract(sin(dot(uv, vec2(12.9898, 78.233))) * 43758.5453);
    color.rgb += (noise - 0.5) * 0.1; // Adjust strength
    gl_FragColor = color;
}
