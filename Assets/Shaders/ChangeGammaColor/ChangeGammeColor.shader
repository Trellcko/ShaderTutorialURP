Shader "Unlit/ChangeGammeColor"
{
     Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
        _Darknees ("Darkness", Range(0, 1)) = 0
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

            #include "Assets\Shaders\ChangeGammaColor\ChangeGammaColorPass.hlsl"
            ENDHLSL
        }
    }
}
