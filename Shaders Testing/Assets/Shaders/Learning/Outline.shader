Shader "Soubra/Outline"
{
		Properties
		{
			_MainTex ("Texture", 2D) = "white" {}
			_SecondTex ("Texture", 2D) = "white" {}
			OutlineColor ("Outline Color", Color) = (0.5,0.5,0.5,1)
			TextureColor("Color", Color) = (0.5,0.5,0.5,1) 
			OutlineWidth ("Outline Width", Range(1.0, 1.5)) = 1.0
			_Range("Lerp Float", Range(0, 1)) = 1.0
		}

		SubShader
		{

			Tags{"Queue" = "Transparent"}

			Pass // Render Outline
			{

				ZWRITE Off

				CGPROGRAM
				#pragma vertex vert
				#pragma fragment frag

				#include "UnityCG.cginc"

				struct appdata
				{
					float4 vertex : POSITION;
					float3 normal : NORMAL;
					float2 uv : TEXCOORD0;
				};

				struct v2f
				{
					float4 pos : POSITION;
					float3 normal : NORMAL;
					float2 uv : TEXCOORD0;
				};

				float4 OutlineColor;
				float OutlineWidth;
				float _Range; 
				sampler2D _MainTex;
				sampler2D _SecondTex;

				v2f vert(appdata v)
				{
					v.vertex.xyz *= OutlineWidth;

					v2f o;
					o.pos = UnityObjectToClipPos(v.vertex);
					return o;
				};

				half4 frag(v2f i) : COLOR
				{
					return OutlineColor;
				}

				ENDCG
			}

			Pass
			{
				SetTexture[_MainTex]
				{
					ConstantColor[Color]
				}
			}

		}
    
}
