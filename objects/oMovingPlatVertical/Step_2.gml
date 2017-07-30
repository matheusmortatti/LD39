/// @description Insert description here
// You can write your code in this editor

if(active) {

	if(yTarget == y and alarm[0] <= 0) {
		spd = 0;
		alarm[0] = delay;
	}

	vy = sign(yTarget-y)*spd;

	y = Approach(y, yTarget, vy);

	if (target != noone) {
		target.y += vy;
	}

}
