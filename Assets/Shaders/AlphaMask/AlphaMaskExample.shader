Shader "Unlit/AlphaMask"
{
    Properties
    {
        [Enum(On, 1, Off, 0)]
        _Enable("Enable", float) = 1

        _MainTex("Texture", 2D) = "white" {}
        
        _BaseColor("Color", Color) = (1,1,1,1) 
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }

        Pass
        {
            AlphaToMask [_Enable]

            HLSLPROGRAM
            #pragma vertex vertex;
            #pragma fragment fragment;

            #include "Assets\Shaders\BasePass.hlsl"
            ENDHLSL
        }
    }
}
