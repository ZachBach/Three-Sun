uniform float time;
uniform float progress;
uniform sampler2D texture1;
uniform vec4 resolution;
varying vec2 vUv;
varying vec3 vPosition;
float PI=3.141592653589793238;


void main(){
// vec2 newUV = (vUv - vec2(0.5))*resolution.zw + vec2(0.5);
vec4 p = vec4(vPosition*3.,time*0.05);
float noisy = fbm(p);
vec4 p1 = vec4(vPosition*2.,time*0.05);
float spots = max(snoise(p1),0.);
gl_FragColor = vec4(noisy);
// gl_FragColor=vec4(vPosition,1.);
gl_FragColor *= mix(1.,spots,0.7);
}