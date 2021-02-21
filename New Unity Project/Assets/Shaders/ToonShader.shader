Shader "Tutorial/Textured Colored" {
    Properties{
        _Color("色調補正", Color) = (1,1,1,1)
        _PropertyTex("プロパティ", 2D) = "white" { }
        _PaletteTex("パレット", 2D) = "white" { }
    }
    SubShader
    {
        Pass    // 主線の描画
        {
            CGPROGRAM
            #pragma vertex Vertex_Main
            #pragma fragment Fragment_Main

            #include "UnityCG.cginc"

            fixed4 _Color;
            UNITY_DECLARE_TEX2D(_PropertyTex);
            UNITY_DECLARE_TEX2D(_PaletteTex);

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
                uint vid : SV_VertexID;
            };

            vert2frag Vertex_Main(hard2vert v)
            {
                vert2frag o = (vert2frag)0;

                o.pos = UnityObjectToClipPos(v.vertex);
                o.normal = UnityObjectToWorldNormal(v.normal);
                o.vid = v.vid;

                return o;
            }

            fixed4 Fragment_Main(vert2frag i) : SV_Target
            {
                //fixed4 texcol = tex2D(_MainTex, i.uv);
                return _Color;
            }
            ENDCG

        }
        Pass    // 表面の描画
        {
            CGPROGRAM
            #pragma vertex Vertex_Main
            #pragma fragment Fragment_Main

            #include "UnityCG.cginc"

            fixed4 _Color;
            UNITY_DECLARE_TEX2D(_PropertyTex);
            UNITY_DECLARE_TEX2D(_PaletteTex);

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
                uint vid : SV_VertexID;
            };

            vert2frag Vertex_Main(hard2vert v)
            {
                vert2frag o = (vert2frag)0;

                o.pos = UnityObjectToClipPos(v.vertex);
                o.normal = UnityObjectToWorldNormal(v.normal);
                o.vid = v.vid;

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