Shader "Unlit/ColorMask"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
        _BaseColor ("Color", Color) = (1,1,1,1)
        [Enum(UnityEngine.Rendering.ColorWriteMask)]
        _ColorMask ("Type", int) = 0
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }

        Pass
        {
            ColorMask[_ColorMask]

            HLSLPROGRAM
            #pragma vertex vertex;
            #pragma fragment fragment;

            #include "Assets\Shaders\BasePass.hlsl"
            ENDHLSL
        }
    }
}
