Shader "Unlit/Blending"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
        _BaseColor ("Color", Color) = (1,1,1,1) 

        [Enum(UnityEngine.Rendering.BlendMode)]
        _SrcFactor ("SrcFactor", float) = 0
        
        [Enum(UnityEngine.Rendering.BlendMode)]
        _DstFactor ("DstFactor", float) = 0
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }

        Pass
        {
            Blend[_SrcFactor][_DstFactor]

            HLSLPROGRAM
            #pragma vertex vertex;
            #pragma fragment fragment;

            #include "Assets\Shaders\BasePass.hlsl"
            ENDHLSL
        }
    }
}
