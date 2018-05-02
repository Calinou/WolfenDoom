// Modified by AFADoomer from http://www.blog.nathanhaze.com/glsl-desert-mirageheat-wave-effect/

const float stepsize = 0.000015;
const float stepscale = 200.0;
const float timescale = 1.0;

void main()
{
	float x =  stepsize * amount * sin(stepscale * TexCoord.x) * sin(timescale * timer);
	float y =  stepsize * amount * sin(stepscale * TexCoord.y) * sin(timescale * timer);

	vec2 c = vec2(TexCoord.x + x, TexCoord.y +y);
	vec4 color = texture(InputTexture, c);

	FragColor = vec4(color.rgb, 1.0);
}