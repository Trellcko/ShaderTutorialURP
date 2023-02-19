Shader "Unlit/Masked"
{
     Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
        
        _BaseColor ("Color", Color) = (1,1,1,1) 
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" "Queue"="Geometry"}

        Stencil
        {
            Ref 2 // Reference Value

            //якщо значення Reference Value в Stencil Buffer  не рівне значенюю в Stencil Reference, то ми не викидуємо піксель
            Comp NotEqual
            pass Keep
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
