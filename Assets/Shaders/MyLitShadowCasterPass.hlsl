#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"

float3 _LigthDirection;

struct Attributes
{
	float3 positionOS : POSITION;
	float3 normalOS : NORMAL;
};

struct Intrepolators
{
	float4 positionCS : SV_POSITION;
};

float4 GetShadowCasterPositionCS(float3 positionWS, float3 normalWS)
{
	float3 ligthDirectionWS = _LigthDirection;

	float4 positionCS = TransformWorldToHClip(ApplyShadowBias(positionWS, normalWS, ligthDirectionWS));

	#if UNITY_REVERSED_Z
		positionCS.z = min(positionCS.z, UNITY_NEAR_CLIP_VALUE);
	#else
		positionCS.z = max(positionCS.z, UNITY_NEAR_CLIP_VALUE);
	#endif

	return positionCS;
}

Intrepolators Vertex(Attributes input)
{
	Intrepolators output;

	VertexPositionInputs position =  GetVertexPositionInputs(input.positionOS);
	VertexNormalInputs normal = GetVertexNormalInputs(input.normalOS);

	output.positionCS = GetShadowCasterPositionCS(position.positionWS, normal.normalWS);

	return output;
}

float4 Fragment(Intrepolators input) : SV_TARGET
{
	return 1;
}