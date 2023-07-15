//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec3 blendcolor1;
uniform vec3 blendcolor2;

void main()
{ 
    vec4 s_col = vec4 (v_vColour * texture2D( gm_BaseTexture, v_vTexcoord ));
    float channels = (s_col.r + s_col.g + s_col.b);
	if (channels > 2.9) //white
    {
        s_col.rgb = blendcolor1;
    }
	else if (channels > 2.2) //lightest
    {
        s_col.rgb = 0.8*blendcolor1;
    }
	else if (channels > 1.8) //light
	{
		s_col.rgb = 0.6*blendcolor1;
	}
	else if (channels > 0.9) //dark
	{
		s_col.rgb = 0.4*blendcolor1;
	}
    else if (channels > 0.1) //darker but not black
	{
		s_col.rgb = 0.2*blendcolor1;
	}
    else //black
    {
        s_col.rgb = blendcolor2;//( 1.0 - (2.0 * (1.0 - (blendcolor - vec3(1.0,1.0,1.0))) * (1.0 - s_col.rgb)) );
    }
    gl_FragColor = vec4(s_col);
}
