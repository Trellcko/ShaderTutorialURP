Shader "Unlit/Step"
{
     Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
        
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

            #include "Assets\Shaders\Step\StepPass.hlsl"
            ENDHLSL
        }
    }
}
