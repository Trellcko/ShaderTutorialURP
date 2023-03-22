Shader "Unlit/BlockGradient"
{
     Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
        [IntRange]_Section("Section", Range(2, 10)) = 6
        _Gamma("Gamma", float) = 1
        _BaseColor ("Color", Color) = (1,1,1,1) 
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }

        Pass
        {
            HLSLPROGRAM
            #pragma vertex vertex;
            #pragma fragment fragment;

            #include "Assets\Shaders\BlockGradient\BlockGradientPass.hlsl"
            ENDHLSL
        }
    }
}
