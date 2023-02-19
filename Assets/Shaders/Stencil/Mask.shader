Shader "Unlit/Mask"
{
     Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
        
        _BaseColor ("Color", Color) = (1,1,1,1) 
    }
    SubShader
    {
        Tags {"Queue"="Geometry-1" }//To make our Mask first in Z Buffer
        ZWrite Off // ��������� z buffer ��� ���� �����, ��� ��� �� ���������� �� ������� ��������� ������
        ColorMask 0 // ��������� Alpha �����

        Stencil
        {
            Ref 2 // Refence Value

            // ������ ��������� �������� Stencill Buffer StencilReff
            Comp Always
            pass Replace
        }

        Pass
        {
            HLSLPROGRAM
            #pragma vertex vertex;
            #pragma fragment fragment;

            #include "Assets\Shaders\BasePass.hlsl"
            ENDHLSL
        }
    }
}
