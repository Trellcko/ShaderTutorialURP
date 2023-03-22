#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"

struct Input
{
	half3 positionOS : POSITION;
	half2 uv : TEXCOORD0;
};

struct Output
{
    half4 positionCS : SV_POSITION;   
	half2 uv : TEXCOORD0;
};

half4 _BaseColor;
half _Speed;
sampler2D _MainTex;
float4 _MainTex_ST;

half4 rotationY(half4 vertex)
{
	half s = sin(_Time.y * _Speed);
	half c = cos(_Time.y * _Speed);

	half4x4 temp= float4x4(
		c,0,s,0,
		0,1,0,0,
		-s,0,c,0,
		0,0,0,1
	);

	return mul(temp, vertex);
}

half4 rotationX(half4 vertex)
{
	half s = sin(_Time.y * _Speed);
	half c = cos(_Time.y * _Speed);

	half4x4 temp= float4x4(
		1,0,0,0,
		0,c,-s,0,
		0,s,c,0,
		0,0,0,1
	);

	return mul(temp, vertex);
}

half4 rotationZ(half4 vertex)
{
	half s = sin(_Time.y * _Speed);
	half c = cos(_Time.y * _Speed);

	half4x4 temp= float4x4(
		c,-s,0,0,
		s,c,0,0,
		0,0,1,0,
		0,0,0,1
	);
	return mul(temp, vertex);
}

Output vertex(Input input)
{
	Output o = (Output)0;
	VertexPositionInputs  positionInput = GetVertexPositionInputs(input.positionOS);
	
	half4 positionCS = rotationZ(positionInput.positionCS);

	o.positionCS = positionCS;
	
	o.uv = TRANSFORM_TEX(input.uv, _MainTex);
	return o;
}

half4 fragment(Output o) : SV_TARGET
{
	half4 texColor = tex2D(_MainTex, o.uv);

	return _BaseColor * texColor;
}
