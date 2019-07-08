Shader "Soubra/Example"
{
	Properties
	{
		_Col("Color: ", Color) = (1,0,0,1)
	}
		SubShader//
	{

		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag

			#include "UnityCG.cginc"

			half3 _Col;

			struct vertexShaderInput
			{
				float4 position:POSITION;
				float3 normal:NORMAL;
				float2 uv:TEXCOORD0;
			};

			struct vertexToFragment 
			{
				float4 position:SV_POSITION;
				float3 normal: NORMAL;
				float2 uv: Test;
			};
			vertexToFragment vert(vertexShaderInput vsi) 
			{
				vertexToFragment output;
			output.position = vsi.position;
			output.normal = vsi.normal;
			output.uv = vsi.uv;

				return output;
			}

			half3 frag(float4 i:SV_POSITION) :SV_Target
			{
				return _Col;
			}

           /* struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float2 uv : TEXCOORD0;
                UNITY_FOG_COORDS(1)
                float4 vertex : SV_POSITION;
            };

            sampler2D _MainTex;
            float4 _MainTex_ST;

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);
                UNITY_TRANSFER_FOG(o,o.vertex);
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                // sample the texture
                fixed4 col = tex2D(_MainTex, i.uv);
                // apply fog
                UNITY_APPLY_FOG(i.fogCoord, col);
                return col;
            } */
            ENDCG
        }
    }
}
