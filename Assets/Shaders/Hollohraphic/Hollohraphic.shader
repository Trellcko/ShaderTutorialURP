Shader "Unlit/Hollohraphic"
{
     Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
        _Section("Section", Range(2, 10)) = 6
        _Speed("Speed", Float) = 1
        _BaseColor ("Color", Color) = (1,1,1,1) 
    }
    SubShader
    {
        Tags { "RenderType"="Transparent" "RenderQueue"="Transparent" }
        Blend SrcAlpha OneMinusSrcAlpha
        Pass
        {
            
            AlphaToMask On
            HLSLPROGRAM
            #pragma vertex vertex;
            #pragma fragment fragment;

            #include "Assets\Shaders\Hollohraphic\HollohraphicPass.hlsl"
            ENDHLSL
        }
    }
}
