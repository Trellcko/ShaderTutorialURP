
Shader "TrellShaders/MyLit"
{
	Properties
	{
		[Header(Surface Option)]// just header
		[MainColor] // for material.color = yourColor  
		_ColorTint("Tint", Color) = (1, 1, 1, 1)
	
		[MainTexture] _ColorMap("Color", 2D) = "white" {}
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

			#include "MyLitFowradLitPass.hlsl"


			ENDHLSL
		}
	}
}