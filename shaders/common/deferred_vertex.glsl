/* Config, uniforms, ins, outs */
#include "/lib/config.glsl"

// Pseudo-uniforms uniforms
uniform int worldTime;

#ifdef THE_END
  #include "/lib/color_utils_end.glsl"
#elif defined NETHER
  #include "/lib/color_utils_nether.glsl"
#else
  #include "/lib/color_utils.glsl"
#endif

uniform mat4 gbufferModelView;

#if (V_CLOUDS != 0 && !defined UNKNOWN_DIM) && !defined NO_CLOUDY_SKY
  uniform float rainStrength;
#endif

varying vec2 texcoord;
varying vec3 up_vec;

#if (V_CLOUDS != 0 && !defined UNKNOWN_DIM) && !defined NO_CLOUDY_SKY
  varying float umbral;
  varying vec3 cloud_color;
  varying vec3 dark_cloud_color;
#endif

#if (V_CLOUDS != 0 && !defined UNKNOWN_DIM) && !defined NO_CLOUDY_SKY
  #include "/lib/luma.glsl"
#endif

void main() {
  // Pseudo-uniforms section
  float day_moment = day_moment();
  float day_mixer = day_mixer(day_moment);
  float night_mixer = night_mixer(day_moment);
  
  gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;
  texcoord = gl_MultiTexCoord0.xy;
  up_vec = normalize(gbufferModelView[1].xyz);

  #if (V_CLOUDS != 0 && !defined UNKNOWN_DIM) && !defined NO_CLOUDY_SKY
    #include "/lib/volumetric_clouds_vertex.glsl"
  #endif
}