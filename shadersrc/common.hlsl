// common data shared among all screenspace shaders

// up to four textures available for sampling
sampler TexBase : register( s0 ); // $basetexture
sampler Tex1    : register( s1 ); // $texture1
sampler Tex2    : register( s2 ); // $texture2
sampler Tex3    : register( s3 ); // $texture3

// normalized dimensions for each texture above
// (x = 1.0 / width, y = 1.0 / height)
float2 TexBaseSize : register( c4 );
float2 Tex1Size    : register( c5 );
float2 Tex2Size    : register( c6 );
float2 Tex3Size    : register( c7 );

// customizable parameters $c0, $c1, $c2, $c3
const float4 Constants0 : register( c0 );
const float4 Constants1 : register( c1 );
const float4 Constants2 : register( c2 );
const float4 Constants3 : register( c3 );

// eye position in world coordinates
const float4 EyePosition : register( c11 );

// xyz will be 0, 0, 0 (black) if mesh is rendered without fog
const float4 FogColor    : register( c29 );
// range of compressed depth buffer. usually 1.0 / 192
#define DepthRange         FogColor.w 

const float4 HDRParams   : register( c30 );
// exposure scale (bounded by tonemap controller's min/max)
#define TonemapScale       HDRParams.x
// 16 in HDR, 4.59479 in LDR
#define LightmapScale      HDRParams.y
// 16 in HDR, 1 in LDR
#define EnvmapScale        HDRParams.z
// gamma, equivalent to pow(TonemapScale, 1.0 / 2.2)
#define GammaScale         HDRParams.w

// interpolated vertex data from vertex shader, do not change
struct PS_INPUT
{
	// texture coordinates
	float2 uv		    : TEXCOORD0;
	// always (0, 0)
	float2 zeros        : TEXCOORD1;
	// unused
	float2 texcoord2    : TEXCOORD2;
	// vertex color (if mesh has one)
	float4 color		: TEXCOORD3;
};