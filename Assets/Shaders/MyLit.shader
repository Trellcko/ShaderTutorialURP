
Shader "TrellShaders/MyLit"
{
	Properties
	{
		[Header(Surface Option)]// just header
		[MainColor] // for material.color = yourColor  
		_ColorTint("Tint", Color) = (1, 1, 1, 1)
	
		[MainTexture] _ColorMap("Color", 2D) = "white" {}
		_Smootheness("Smoothness", float) = 1
	}

	SubShader
	{
		Tags {"RenderPipeline" = "UniversalPipeline"}	

		Pass 
		{
			Name "ForwardLit"
			
			Tags { "LigthMode" = "UniversalForward" }

			HLSLPROGRAM
			#pragma vertex Vertex
			#pragma fragment Fragment

			#define _SPECULAR_COLOR
			#include "MyLitFowradLitPass.hlsl"


			ENDHLSL
		}
	}
}