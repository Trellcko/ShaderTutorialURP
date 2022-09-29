#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"

float4 _ColorTint;

TEXTURE2D(_ColorMap);// textures definition
SAMPLER(sampler_ColorMap); //structure what defined how to read the texture (include the clamping, sampling)
float4 _ColorMap_ST; // automatically create by unity. uSED IN TRANSFORM_TEX to apply uv tilling
float _Smootheness;

struct Attributes
{
	float3 positionOS : POSITION;
	float3 normalOS : NORMAL;
	float2 uv : TEXCOORD0;
};

struct Intrepolators
{
	float4 positionCS : SV_POSITION;
	
	float2 uv : TEXCOORD0;
	float3 normalWS : TEXCOORD1;
	float3 positionWS : TEXCOORD2;
};

Intrepolators Vertex(Attributes input)
{
	Intrepolators output;

	VertexPositionInputs position = GetVertexPositionInputs(input.positionOS);
	VertexNormalInputs normalInputs = GetVertexNormalInputs(input.normalOS);
	

	output.normalWS = normalInputs.normalWS;
	output.positionCS = position.positionCS;
	output.positionWS = position.positionWS;

	//apply uv tiling, scaling and offset
	output.uv = TRANSFORM_TEX(input.uv, _ColorMap);
	return output;
}

float4 Fragment(Intrepolators input) : SV_TARGET
{
	//read color data from texture
	float4 colorSample = SAMPLE_TEXTURE2D(_ColorMap, sampler_ColorMap, input.uv);

	
	//	return colorSample*_ColorTint;

	
	// holidng data of position and orientation of the mesh at the current Fragment
	InputData ligthingInput = (InputData)0;
	ligthingInput.normalWS = input.normalWS;
	ligthingInput.positionWS = input.positionWS;
	ligthingInput.viewDirectionWS = GetWorldSpaceNormalizeViewDir(input.positionWS);
	ligthingInput.shadowCoord = TransformWorldToShadowCoord(input.positionWS);
	// surface materials fhysical properties like color 
	SurfaceData surfaceInput = (SurfaceData)0;

	surfaceInput.albedo = colorSample.rgb * _ColorTint.rgb;
	surfaceInput.alpha = colorSample.a * _ColorTint.a;
	surfaceInput.specular = 1;
	surfaceInput.smoothness = _Smootheness;

	// compute ligthing alghoritm blinnPhong 

	/* 
	include 2 components in alghoritm first
	
	The first calculate diffuse ligthing

	The second specular ligthng like a shing, highligthing
	*/
	#if UNITY_VERSION >= 202120
	return UniversalFragmentBlinnPhong(ligthingInput, surfaceInput);

	#else
	return UniversalFragmentBlinnPhong(ligthingInput, surfaceInput.albedo, half4(surfaceInput.specular, 1), surfaceInput.smoothness, 0, surfaceInput.alpha);
	#endif
}


