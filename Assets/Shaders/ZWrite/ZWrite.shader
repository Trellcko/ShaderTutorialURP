Shader "Unlit/ZWrite"
{
     Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
        
        _BaseColor ("Color", Color) = (1,1,1,1) 



    }
    SubShader
    {
        Tags { "RenderType"="Transparent" }

        Pass
        {
            //Turn off for Transperency
            ZWrite  Off
            //base tranperency blend
            Blend SrcAlpha OneMinusSrcAlpha

            HLSLPROGRAM
            #pragma vertex vertex;
            #pragma fragment fragment;

            #include "Assets\Shaders\BasePass.hlsl"
            ENDHLSL
        }
    }
}
