shader_type canvas_item;

uniform sampler2D gradient: repeat_enable, filter_nearest;
uniform sampler2D SCREEN_TEXTURE: hint_screen_texture, filter_nearest_mipmap_anisotropic;
uniform float speed_scale = 0;
uniform float palette = 1;
uniform float palette_number = 1.0;


void fragment() {
	vec4 c = texture(SCREEN_TEXTURE, SCREEN_UV);
	float x = (c.r + c.g + c.b) / 3.0  - TIME * speed_scale;
	COLOR = vec4(texture(gradient, vec2(x, (palette) / palette_number)).rgb, c.a);
	//float a = color.t;
	//COLOR = vec4(a,a,a,1.0);
	//COLOR = vec4((color.r).rgb, color.a);
}