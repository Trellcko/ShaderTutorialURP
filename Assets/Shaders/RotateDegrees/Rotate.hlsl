#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"

#define UNITY_PI 3.14159265359f

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

sampler2D _MainTex;
half4 _MainTex_ST;
half4 _BaseColor;
half _Rotate;

Output vertex(Input input)
{
    Output output = (Output)0;
    TRANSFORM_TEX(input.uv, _MainTex);
    VertexPositionInputs vertexPosition = GetVertexPositionInputs(input.positionOS);

    output.uv = input.uv;
    output.positionCS = vertexPosition.positionCS;

    return output;
}
// https://docs.unity3d.com/Packages/com.unity.shadergraph@7.1/manual/Rotate-Node.html
void RotateDegreesFloat(half2 uv, half2 center, half rotation, out half2 result)
{
    rotation *= (UNITY_PI / 180);

    uv -= center;
    float sinus = sin(rotation);
    float cosinus = cos(rotation);
    float2x2 rotateMatrix = float2x2(cosinus, -sinus, sinus, cosinus);
    rotateMatrix *= 0.5f;
    rotateMatrix += 0.5f;
    rotateMatrix = rotateMatrix * 2 - 1;
    uv.xy = mul(uv.yx, rotateMatrix);
    uv += center;
    result = uv;
}

half4 fragment(Output output) : SV_Target
{
    half2 uv;

    uv.x = abs(output.uv.x - 0.5f);
    uv.y = abs(output.uv.y - 0.5f);

    half rotation = _Rotate;

    half2 center = 0.5f;
    half2 resultUV = (half2)0;


    RotateDegreesFloat(uv, center, rotation, resultUV);

    half4 texColor = tex2D(_MainTex, resultUV);
    return texColor * _BaseColor;
}