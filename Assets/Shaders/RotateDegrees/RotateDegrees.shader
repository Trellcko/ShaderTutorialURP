Shader "Unlit/RotateDegrees"
{
     Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
        _Rotate ("Rotate", float) = 0
        _BaseColor ("Color", Color) = (1,1,1,1) 
    }
    SubShader
    {
        Tags { "RenderType"="Transparent" "Queue"="Transparent" }

        ZWrite Off
        Blend SrcAlpha OneMinusSrcAlpha

        Pass
        {
            HLSLPROGRAM
            #pragma vertex vertex;
            #pragma fragment fragment;

            #include "Assets\Shaders\RotateDegrees\Rotate.hlsl"
            ENDHLSL
        }
    }
}
