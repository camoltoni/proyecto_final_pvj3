shader_type canvas_item;

uniform float level = 0.0;
uniform vec3 level_color = vec3(1.0, 0.0, 0.0);

void fragment() {
    vec4 color = texture(TEXTURE, UV);
    vec4 new_color = mix(color,vec4(level_color, color.a), step(level, UV.y)); // Cambia el color a rojo
    color = mix(color, new_color, color.a); // Mezcla los colores según las máscaras
    COLOR = color;
}