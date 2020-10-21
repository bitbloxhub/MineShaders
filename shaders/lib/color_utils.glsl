/* MakeUp Ultra Fast - color_utils.glsl
Usefull data for color manipulation.

Javier Garduño - GNU Lesser General Public License v3.0
*/

// Direct light color per hour
const vec3 ambient_baselight[25] =
  vec3[25](
  vec3(0.376470588235294, 0.341176470588235, 0.08529411764705849), // 6
  vec3(0.835294117647059, 0.737254901960784, 0.29117647058823526), // 7
  vec3(1.0, 0.941176470588235, 0.5499999999999997), // 8
  vec3(1.0, 0.988235294117647, 0.6), // 9
  vec3(1.0, 1., 0.6375), // 10
  vec3(1.0, 1., 0.6375), // 11
  vec3(1.0, 1., 0.6375), // 12
  vec3(1.0, 1., 0.6375), // 1
  vec3(1.0, 1., 0.6375), // 2
  vec3(1.0, 0.988235294117647, 0.6), // 3
  vec3(1.0, 0.941176470588235, 0.5499999999999997), // 4
  vec3(0.835294117647059, 0.737254901960784, 0.29117647058823526), // 5
  vec3(0.376470588235294, 0.341176470588235, 0.08529411764705849), // 6
  vec3(0.137254901960784, 0.084313725490196, 0.11029411764705899), // 7
  vec3(0.072549019607843, 0.07843137254902, 0.0926470588235295), // 8
  vec3(0.072549019607843, 0.07843137254902, 0.0926470588235295), // 9
  vec3(0.072549019607843, 0.07843137254902, 0.0926470588235295), // 10
  vec3(0.072549019607843, 0.07843137254902, 0.0926470588235295), // 11
  vec3(0.072549019607843, 0.07843137254902, 0.0926470588235295), // 12
  vec3(0.072549019607843, 0.07843137254902, 0.0926470588235295), // 1
  vec3(0.072549019607843, 0.07843137254902, 0.0926470588235295), // 2
  vec3(0.072549019607843, 0.07843137254902, 0.0926470588235295), // 3
  vec3(0.072549019607843, 0.07843137254902, 0.0926470588235295), // 4
  vec3(0.137254901960784, 0.084313725490196, 0.11029411764705899), // 5
  vec3(0.376470588235294, 0.341176470588235, 0.08529411764705849) // 6
);

// Ambient color luma per hour in exposure calculation
const float ambient_exposure[25] =
  float[25](
  .8, // 6
  1.0, // 7
  1.0, // 8
  1.0, // 9
  1.0, // 10
  1.0, // 11
  1.0, // 12
  1.0, // 13
  1.0, // 14
  1.0, // 15
  1.0, // 16
  1.0, // 17
  .8, // 18
  .6, // 19
  .5, // 20
  .5, // 21
  .5, // 22
  .5, // 23
  .5, // 24
  .5, // 1
  .5, // 2
  .5, // 3
  .5, // 4
  .6, // 5
  .8 // 6
  );

// How many sky_color vs. fog_color is used for fog.
const float fog_color_mix[25] =
  float[25](
  1.0, // 6
  .5, // 7
  .0, // 8
  .0, // 9
  .0, // 10
  .0, // 11
  .0, // 12
  .0, // 13
  .0, // 14
  .0, // 15
  .0, // 16
  .5, // 17
  1.0, // 18
  1.0, // 19
  1.0, // 20
  1.0, // 21
  1.0, // 22
  1.0, // 23
  1.0, // 24
  1.0, // 1
  1.0, // 2
  1.0, // 3
  1.0, // 4
  1.0, // 5
  1.0 // 6
  );

// Fog parameter per hour
const float fog_density[25] =
  float[25](
  2.0, // 6
  2.5, // 7
  3.0, // 8
  3.0, // 9
  3.0, // 10
  3.0, // 11
  3.0, // 12
  3.0, // 13
  3.0, // 14
  3.0, // 15
  3.0, // 16
  2.5, // 17
  1.0, // 18
  1.0, // 19
  2.5, // 20
  3.0, // 21
  3.0, // 22
  3.0, // 23
  3.0, // 24
  3.0, // 1
  3.0, // 2
  3.0, // 3
  2.5, // 4
  1.0, // 5
  2.0 // 6
  );

// Omni intesity per hour
const float omni_force[25] =
  float[25](
  .6, // 6
  .8, // 7
  1.2, // 8
  1.2, // 9
  1.2, // 10
  1.2, // 11
  1.2, // 12
  1.2, // 13
  1.2, // 14
  1.2, // 15
  1.2, // 16
  .8, // 17
  .6, // 18
  .6, // 19
  3.6, // 20
  4.0, // 21
  4.0, // 22
  4.0, // 23
  4.0, // 24
  4.0, // 1
  4.0, // 2
  4.0, // 3
  3.6, // 4
  .6, // 5
  .6 // 6
  );

const vec3 candle_baselight = vec3(.666, 0.517129411764706, 0.2664);
