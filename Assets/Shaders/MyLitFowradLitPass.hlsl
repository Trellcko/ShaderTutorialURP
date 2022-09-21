#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"

float4 _ColorTint;

TEXTURE2D(_ColorMap);// textures definition
SAMPLER(sampler_ColorMap); //structure what defined how to read the texture (include the clamping, sampling)
float4 _ColorMap_ST; // automatically create by unity. uSED IN TRANSFORM_TEX to apply uv tilling

struct Attributes
{
	float3 positionOS : POSITION;
	float2 uv : TEXCOORD0;
};

struct Intrepolators
{
	float4 positionCS : SV_POSITION;
	float2 uv : TEXCOORD0;
};

Intrepolators Vertex(Attributes input)
{
	Intrepolators output;

	VertexPositionInputs position = GetVertexPositionInputs(input.positionOS);
	
	float4 positionCS = position.positionCS;//get clip position
	

	output.positionCS = positionCS;
	//apply uv tiling, scaling and offset
	output.uv = TRANSFORM_TEX(input.uv, _ColorMap);
	return output;
}

float4 Fragment(Intrepolators input) : SV_TARGET
{
	//read color data from texture
	float4 colorMap = SAMPLE_TEXTURE2D(_ColorMap, sampler_ColorMap, input.uv);
	return colorMap * _ColorTint;
}


