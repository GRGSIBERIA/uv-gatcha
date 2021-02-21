Shader "Tutorial/Textured Colored" {
    Properties{
        _Color("Main Color", Color) = (1,1,1,0.5)
        _MainTex("Texture", 2D) = "white" { }
    }
    SubShader
    {
        Pass 
        {
            CGPROGRAM
            #pragma vertex Vertex_Main
            #pragma fragment Fragment_Main

            #include "UnityCG.cginc"

            fixed4 _Color;
            UNITY_DECLARE_TEX2D(_MainTex);

            // ハードウェアから転送される情報
            struct hard2vert {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                uint vid : SV_VertexID;
            };

            // 頂点シェーダからピクセルシェーダに渡す情報
            struct vert2frag {
                float4 pos : SV_POSITION;
                float3 normal : NORMAL;
            };

            vert2frag Vertex_Main(hard2vert v)
            {
                vert2frag o = (vert2frag)0;
                o.pos = UnityObjectToClipPos(v.vertex);
                o.normal = UnityObjectToWorldNormal(v.normal);
                return o;
            }

            fixed4 Fragment_Main(vert2frag i) : SV_Target
            {
                //fixed4 texcol = tex2D(_MainTex, i.uv);
                return _Color;
            }
            ENDCG

        }
    }
}