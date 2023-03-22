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

sampler2D _MainTex;
float4 _MainTex_ST;

Output vertex(Input input)
{
	Output o = (Output)0;
	VertexPositionInputs  positionInput = GetVertexPositionInputs(input.positionOS);
	
	half4 positionCS = positionInput.positionCS;

	o.positionCS = positionCS;
	
	o.uv = TRANSFORM_TEX(input.uv, _MainTex);
	return o;
}

half4 fragment(Output o) : SV_TARGET
{
	half edge = 0.2;
	half3 sstep = 0;
	sstep = step (o.uv.y, edge);

	half smooth = 0.1;

	sstep = smoothstep((o.uv.y - smooth), (o.uv.y + smooth), edge);
	
	return half4(sstep, 1);
}