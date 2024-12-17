// Example shader that applies a wave distortion effect to the screen

#include "common.hlsl"

#define Time		Constants0.x
#define Frequency	Constants0.y
#define Amplitude	Constants0.z

float4 main( PS_INPUT i ) : COLOR
{
    float2 offset;
    offset.x = sin(i.baseTexCoord.y * Frequency + Time) * Amplitude;
    offset.y = cos(i.baseTexCoord.x * Frequency + Time * 1.5) * Amplitude;
	
    float2 new_uv = i.baseTexCoord + offset;
	
	return tex2D(TexBase, new_uv);	
}
