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
half _Section;
half _Gamma;
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
	half fv = floor(o.uv.y * _Section) * (_Section/100);

	half4 texColor = tex2D(_MainTex, o.uv);

	return half4(fv.xxx, 1) + _Gamma;
}