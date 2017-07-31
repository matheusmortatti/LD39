/// @description Insert description here
// You can write your code in this editor

if(active) {

	if(!audioIsPlaying  and vx != 0) {
		audio_play_sound(sndMovingPlat, 0, true);
		audioIsPlaying = true;
	}
	else if (vx == 0)
		audio_stop_sound(sndMovingPlat);

	if(xTarget == x and alarm[0] <= 0) {
		spd = 0;
		alarm[0] = delay;
	}

	vx = sign(xTarget-x)*spd;

	x = Approach(x, xTarget, vx);

	if (target != noone) {
		target.x += vx;
	}

}
else {
	audioIsPlaying=false;
	audio_stop_sound(sndMovingPlat);
}
