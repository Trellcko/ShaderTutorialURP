#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"

struct Input
{
	half3 positionOS : POSITION;
};

struct Output
{
    half4 positionCS : SV_POSITION;            
};

half4 _FrontColor;
half4 _BackColor;

Output vertex(Input input)
{
	Output o = (Output)0;
	
	VertexPositionInputs  positionInput = GetVertexPositionInputs(input.positionOS);
	
	half4 positionCS = positionInput.positionCS;

	o.positionCS = positionCS;

	return o;
}

half4 fragment(Output o, bool face : SV_ISFRONTFACE) : SV_TARGET
{
	return face? _FrontColor : _BackColor;
}