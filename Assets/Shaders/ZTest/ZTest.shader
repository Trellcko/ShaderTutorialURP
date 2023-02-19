Shader "Unlit/ZTest"
{
     Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
        
        _BaseColor ("Color", Color) = (1,1,1,1) 
  
        [Enum(UnityEngine.Rendering.CompareFunction)]
        _ZTest ("ZTest", int) = 0
  
  /*
  ZTest Less: (<) Draws the objects in front. It ignores objects that are at the same distance or 
behind the shader object.

ZTest Greater: (>) Draws the objects behind. It does not draw objects that are at the same 
distance or in front of the shader object. 

ZTest LEqual: (≤) Default value. Draws the objects that are in front of or at the same distance. 
It does not draw objects behind the shader object. 

ZTest GEqual: (≥) Draws the objects behind or at the same distance. Does not draw objects 
in front of the shader object. 

ZTest Equal: (==) Draws objects that are at the same distance. Does not draw objects in 
front of or behind the shader object.

ZTest NotEqual: (! =) Draws objects that are not at the same distance. Does not draw 
objects that are the same distance from the shader object. 

ZTest Always: Draws all pixels, regardless of the distance of the objects relative to the 
camera. 
  */
  
  }
    SubShader
    {
        Tags { "RenderType"="Opaque" }

        Pass
        {
            ZTest[_ZTest]
            HLSLPROGRAM
            #pragma vertex vertex;
            #pragma fragment fragment;

            #include "Assets\Shaders\BasePass.hlsl"
            ENDHLSL
        }
    }
}
