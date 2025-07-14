// noise.glsl
#version 330 core

// Texture coordinates passed from picom
in vec2 texCoord;
// The current frame (the window contents)
uniform sampler2D tex;
// Output color
out vec4 FragColor;

// A simple pseudo-random function based on texture coordinates
float random(vec2 st) {
    return fract(sin(dot(st, vec2(12.9898, 78.233))) * 43758.5453123);
}

void main() {
    // Get the current pixel color
    vec4 color = texture(tex, texCoord);
    // Generate a noise value based on the fragment coordinates
    float noise = random(texCoord + gl_FragCoord.xy);
    // Mix in the noise with a small intensity (adjust 0.05 to taste)
    FragColor = vec4(color.rgb + noise * 0.05, color.a);
}
