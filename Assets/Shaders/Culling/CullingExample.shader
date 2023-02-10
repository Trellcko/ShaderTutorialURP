Shader "Unlit/Culling"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}

        _FrontColor ("FronColor", Color) = (0,0,0,1)

        _BackColor ("BackColor", Color) = (1,1,1,1)

        [Enum(UnityEngine.Rendering.CullMode)]
        _Cull("Cull", float) = 0
    }
    SubShader
    {
        Tags { "RenderPipeline"="UniversalPipeline" }

        Pass
        {
            Cull[_Cull]

            HLSLPROGRAM

            #pragma vertex vertex;
            #pragma fragment fragment;

            #include "Assets\Shaders\Culling\Culling.hlsl"
            ENDHLSL
        }
    }
}
