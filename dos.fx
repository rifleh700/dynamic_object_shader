
float4 gMaterialAmbient     < string materialState="Ambient"; >;
float4 gMaterialDiffuse     < string materialState="Diffuse"; >;
float4 gMaterialSpecular    < string materialState="Specular"; >;
float4 gMaterialEmissive    < string materialState="Emissive"; >;
float gMaterialSpecPower    < string materialState="Power"; >;

float lighting = 0.5;

technique object {
    pass P0 {
        MaterialAmbient = gMaterialAmbient * (lighting * 0.95 + 0.05);
        MaterialDiffuse = gMaterialDiffuse;
        MaterialPower = gMaterialSpecPower;
        MaterialSpecular = gMaterialSpecular * (lighting * 0.95 + 0.05);
        MaterialEmissive = gMaterialEmissive;
    }
}

technique fallback {
	pass P0 {
	}
}