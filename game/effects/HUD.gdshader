shader_type canvas_item;

void fragment() {
	vec2 n_UV = vec2(UV.x + sin(TIME * 100.0) * 0.05, UV.y);
	COLOR = texture(TEXTURE, n_UV);
}