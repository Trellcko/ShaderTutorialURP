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
half _Zoom;
sampler2D _MainTex;
half4 _MainTex_ST;
half4 _CenterPoint;

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
	half2 uv = (half2)0;

	half2 uvLerp = (half2)0;

	//because wee ne zoom start point from center we multyply by 0.5
	uv.x = ceil(o.uv.x) * _CenterPoint.x;
	uv.y = ceil(o.uv.y) * _CenterPoint.y;

	uvLerp.x = lerp(uv.x, o.uv.x, _Zoom);
	uvLerp.y = lerp(uv.x, o.uv.y, _Zoom);

	half4 texColor = tex2D(_MainTex, uvLerp);

	return _BaseColor * texColor;
}