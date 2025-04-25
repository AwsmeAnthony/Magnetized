shader_type canvas_item;


uniform sampler2D wave_texture : repeat_enable;
uniform sampler2D SCREEN_TEXTURE : hint_screen_texture;
uniform vec4 color : source_color;
uniform vec4 top_color : source_color;

void fragment() {
	vec4 waves = texture(wave_texture,UV + TIME * vec2(0.05,0.05)).r * texture(wave_texture,UV + TIME * vec2(-0.05,-0.05));

    vec4 col = texture(SCREEN_TEXTURE,SCREEN_UV + vec2(1.5,1.5) * waves.rr);

	vec4 top_light = smoothstep(0.07,0.04,waves) * top_color;

	COLOR = col*color+top_light;
}