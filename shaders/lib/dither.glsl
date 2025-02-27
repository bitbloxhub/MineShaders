/* MakeUp - dither.glsl
Dither and hash functions

*/

float hash12(vec2 v)
{
  v = 0.0002314814814814815 * v + vec2(0.25, 0.0);
  float state = fract(dot(v * v, vec2(3571.0)));
  return fract(state * state * 7142.0);
}

float r_dither(vec2 frag) {
  return fract(dot(frag, vec2(0.75487766624669276, 0.569840290998)));
}

float eclectic_r_dither(vec2 frag) {
  vec2 v = 0.0002314814814814815 * frag + vec2(0.25, 0.0);
  float state = fract(dot(v * v, vec2(3571.0)));
  float p4 = fract(state * state * 7142.0) * 0.15;

  return fract(p4 + dot(frag, vec2(0.75487766624669276, 0.569840290998)));
}

float dither_plastic(vec2 frag)
{
  return 2.0 * abs(fract(dot(frag, vec2(0.75487766624669276, 0.569840290998))) - 0.5);
}

float eclectic_dither_plastic(vec2 frag)
{
  vec2 v = 0.0002314814814814815 * frag + vec2(0.25, 0.0);
  float state = fract(dot(v * v, vec2(3571.0)));
  float p4 = fract(state * state * 7142.0) * 0.15;

  return fract(p4 + (2.0 * abs(fract(dot(frag, vec2(0.75487766624669276, 0.569840290998))) - 0.5)));
}

float dither13(vec2 pos)
{
  return fract(dot(pos, vec2(0.3076923076923077, 0.5384615384615384)));
}

float eclectic_dither13(vec2 pos)
{
  vec2 v = 0.0002314814814814815 * pos + vec2(0.25, 0.0);
  float state = fract(dot(v * v, vec2(3571.0)));
  float p4 = fract(state * state * 7142.0) * 0.15;

  return fract(p4 + dot(pos, vec2(0.3076923076923077, 0.5384615384615384)));
}

float dither17(vec2 pos) {
  return fract(dot(pos, vec2(0.11764705882352941, 0.4117647058823529)));
}

float eclectic_dither17(vec2 frag) {
  vec2 v = 0.0002314814814814815 * frag + vec2(0.25, 0.0);
  float state = fract(dot(v * v, vec2(3571.0)));
  float p4 = fract(state * state * 7142.0) * 0.15;

  return fract(p4 + dot(frag, vec2(0.11764705882352941, 0.4117647058823529)));
}

float dither_grad_noise(vec2 frag) {
  return fract(52.9829189 * fract(dot(vec2(0.06711056, 0.00583715), frag)));
}

float eclectic_dither(vec2 frag) {
  vec2 v = 0.0002314814814814815 * frag + vec2(0.25, 0.0);
  float state = fract(dot(v * v, vec2(3571.0)));
  float p4 = fract(state * state * 7142.0) * 0.15;

  return fract(p4 + (52.9829189 * fract(dot(vec2(0.06711056, 0.00583715), frag))));
}

float texture_noise_64(vec2 p, sampler2D noise) {
  return texture2D(noise, p * 0.015625).r;
}

float semiblue(vec2 xy) {
  vec2 tile = floor(xy * 0.25);
  float flip = mod(tile.x + tile.y, 2.0);
  xy = mix(xy, xy.yx, flip);

  return fract(dot(vec2(0.75487766624669276, 0.569840290998), xy) + hash12(tile));
}

float makeup_dither(vec2 frag) {
  return fract(dot(frag, vec2(0.8085512046226566, 0.5562305898749054)));
}

float eclectic_makeup_dither(vec2 frag) {
  vec2 v = 0.0002314814814814815 * frag + vec2(0.25, 0.0);
  float state = fract(dot(v * v, vec2(3571.0)));
  float p4 = fract(state * state * 7142.0) * 0.15;

  return fract(p4 + dot(frag, vec2(0.8085512046226566, 0.5562305898749054)));
}

float shifted_hash12(vec2 v, float dither_shift)
{
  v = 0.0002314814814814815 * v + vec2(0.25, 0.0);
  float state = fract(dot(v * v, vec2(3571.0)));
  return fract(dither_shift + (state * state * 7142.0));
}

float shifted_r_dither(vec2 frag, float dither_shift) {
  return fract(dither_shift + dot(frag, vec2(0.75487766624669276, 0.569840290998)));
}

float shifted_eclectic_r_dither(vec2 frag, float dither_shift) {
  vec2 v = 0.0002314814814814815 * frag + vec2(0.25, 0.0);
  float state = fract(dot(v * v, vec2(3571.0)));
  float p4 = fract(state * state * 7142.0) * 0.15;

  return fract(dither_shift + p4 + dot(frag, vec2(0.75487766624669276, 0.569840290998)));
}

float shifted_dither_plastic(vec2 frag, float dither_shift)
{
  return fract(dither_shift + (2.0 * abs(fract(dot(frag, vec2(0.75487766624669276, 0.569840290998))) - 0.5)));
}

float shifted_dither13(vec2 pos, float dither_shift)
{
  return fract(dither_shift + dot(pos, vec2(0.3076923076923077, 0.5384615384615384)));
}

float shifted_eclectic_dither13(vec2 pos, float dither_shift)
{
  vec2 v = 0.0002314814814814815 * pos + vec2(0.25, 0.0);
  float state = fract(dot(v * v, vec2(3571.0)));
  float p4 = fract(state * state * 7142.0) * 0.15;

  return fract(dither_shift + p4 + dot(pos, vec2(0.3076923076923077, 0.5384615384615384)));
}

float shifted_dither17(vec2 frag, float dither_shift) {
  return fract(dither_shift + dot(frag, vec2(0.5882352941176471, 0.8823529411764706)));
}

float shifted_eclectic_dither17(vec2 frag, float dither_shift) {
  vec2 v = 0.0002314814814814815 * frag + vec2(0.25, 0.0);
  float state = fract(dot(v * v, vec2(3571.0)));
  float p4 = fract(state * state * 7142.0) * 0.15;

  return fract(dither_shift + p4 + dot(frag, vec2(0.11764705882352941, 0.4117647058823529)));
}

float shifted_dither_grad_noise(vec2 frag, float dither_shift) {
  return fract(dither_shift + (52.9829189 * fract(dot(vec2(0.06711056, 0.00583715), frag))));
}

float shifted_eclectic_dither(vec2 frag, float dither_shift) {
  vec2 v = 0.0002314814814814815 * frag + vec2(0.25, 0.0);
  float state = fract(dot(v * v, vec2(3571.0)));
  float p4 = fract(state * state * 7142.0) * 0.15;

  return fract(dither_shift + p4 + (52.9829189 * fract(dot(vec2(0.06711056, 0.00583715), frag))));
}

float shifted_texture_noise_64(vec2 p, sampler2D noise, float dither_shift) {
  float dither = texture2D(noise, p * 0.015625).r;
  return fract(dither_shift + dither);
}

float shifted_semiblue(vec2 xy, float dither_shift) {
  vec2 tile = floor(xy * 0.25);
  float flip = mod(tile.x + tile.y, 2.0);
  xy = mix(xy, xy.yx, flip);

  return fract(dither_shift + dot(vec2(0.75487766624669276, 0.569840290998), xy) + hash12(tile));
}

float shifted_makeup_dither(vec2 frag, float dither_shift) {
  return fract(dither_shift + dot(frag, vec2(0.8085512046226566, 0.5562305898749054)));
}

float shifted_eclectic_makeup_dither(vec2 frag, float dither_shift) {
  vec2 v = 0.0002314814814814815 * frag + vec2(0.25, 0.0);
  float state = fract(dot(v * v, vec2(3571.0)));
  float p4 = fract(state * state * 7142.0) * 0.15;

  return fract(dither_shift + p4 + dot(frag, vec2(0.8085512046226566, 0.5562305898749054)));
}