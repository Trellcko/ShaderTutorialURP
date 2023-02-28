Shader "Unlit/Zoom"
{
     Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
        _Zoom ("Zoom", Range(0, 1)) = 0
        _CenterPoint("Center", Vector) = (1, 1, 1, 1) 
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

            #include "Assets\Shaders\Zoom\ZoomPass.hlsl"
            ENDHLSL
        }
    }
}
