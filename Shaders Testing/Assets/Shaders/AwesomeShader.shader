// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Unlit/AwesomeShader"
{
    Properties
    {
        _Color ("Color", Color) = (1,0,0,1)
		_Texture("Texture", 2D) = "white" {}
		_WaveFrequency("Wave Frequency", Range(0,1)) = 1
		_WaveHeight("Wave Height", Range(0,5)) = 1
		_Amplitude("Wave Amplitude", Range(0,10)) = 1
    }
    SubShader
    {

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 position : POSITION;
				float3 normal: NORMAL;
            };

            struct v2f
            {
                float4 position : SV_POSITION;
				float3 normal: NOR;
            };

			float _WaveFrequency;
			float _WaveHeight;
			float _Amplitude;
			float4 _Color;
			sampler2D _MainTex;
            v2f vert (appdata v)
            {
                v2f o;
				v.position = mul(unity_ObjectToWorld, v.position);
				v.position.y += _Amplitude * sin(length(v.position.xz) * _WaveFrequency + _Time.w);
				v.position.y += _Amplitude/100 * sin(2*length(v.position.xz) * _WaveFrequency + _Time.w);
				v.position.y += _Amplitude/10000 * sin(100 * length(v.position.xz) * _WaveFrequency + _Time.w);
				v.position.y += _Amplitude/10000 * sin(100 * length(v.position.xz) * _WaveFrequency + _Time.w);
				v.position.y += _Amplitude/10000 * sin(100 * length(v.position.xz) * _WaveFrequency + _Time.w);
				v.position.y += _Amplitude/10000 * sin(100 * length(v.position.xz) * _WaveFrequency + _Time.w);
				v.position.y += _Amplitude/10000 * sin(100 * length(v.position.xz) * _WaveFrequency + _Time.w);
				v.position.x += _Amplitude * cos(length(v.position.xz) * _WaveFrequency + _Time.w);
				v.position.z += _Amplitude * cos(length(v.position.xz) * _WaveFrequency + _Time.w);
				o.position = mul(UNITY_MATRIX_VP, v.position);
				//o.normal = mul(unity_WorldToObject,v.normal);
                return o;
            }

			fixed3 frag(v2f i) : SV_TARGET
			{
				return _Color / i.position.y * 200;
			}
            ENDCG
        }
    }
}
