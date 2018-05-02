// Modified by AFADoomer from 
// http://www.blog.nathanhaze.com/glsl-desert-mirageheat-wave-effect/
// and from Pixel Eater's Fill Spectre .pk3s

const float stepsize = 0.0006;
const float stepscale = 200.0;
const float timescale = 1.0;

void main()
{
	vec4 pointcolor = texture(InputTexture, TexCoord);
	vec4 color = pointcolor;

	if (color.g < 0.57 && color.r > 0.899 && color.b > 0.899)		
	{
		float x = stepsize * sin(stepscale * TexCoord.x) * sin(timescale * timer);
		float y = stepsize * sin(stepscale / 2 * TexCoord.y) * sin(timescale * timer);

		vec2 c = vec2(TexCoord.x + x, TexCoord.y + y);
		color = texture(InputTexture, c);
	}

	if (color.g < 0.57 && color.r > 0.899 && color.b > 0.899)		
	{
		color.rb = clamp(color.rb - 0.9, 0.000001, 0.1); //remove magenta (already reduced %10 by alpha)
		color.rb *= 10;	//amplify remaining background content up to %100
		color.g = (color.r + color.b) * 0.5;	//green adopts the average of red and blue
	}

	FragColor = color;
}