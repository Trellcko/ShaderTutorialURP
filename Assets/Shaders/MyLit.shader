
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
			//prag for off or on MainLigth shadows

			#if UNITY_VERSION >= 202120
				#pragma multi_compile _ _MAIN_LIGHT_SHADOWS _MAIN_LIGHT_SHADOWS_CASCADE
			#else

			//in c# materia.EnabableKeyword(_MAIN_LIGTH_SHADOWS) materia.DisableKeyword(_MAIN_LIGTH_SHADOWS) 
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS 
			
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS_CASCADE
			#endif
			// To allow Soft Shadow
			#pragma multi_compile_fragment _ _SHADOWS_SOFT

			#include "MyLitFowradLitPass.hlsl"


			ENDHLSL
		}

		Pass
		{
			Name "ShadowCaster"

			Tags{ "LightMode" = "ShadowCaster"}

			HLSLPROGRAM
			
			#pragma vertex Vertex
			#pragma fragment Fragment

			//Because we dont need render color in shadow caster
			ColorMask 0;

			#include "MyLitShadowCasterPass.hlsl"
			
			ENDHLSL
		}
	}
}