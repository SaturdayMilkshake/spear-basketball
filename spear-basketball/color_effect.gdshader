shader_type canvas_item;

uniform float alpha_value = 0.0;
uniform vec4 point_color = vec4(1.0, 1.0, 1.0, 0.0);

void fragment() {
	COLOR = texture(TEXTURE, UV);
	COLOR = point_color;
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
