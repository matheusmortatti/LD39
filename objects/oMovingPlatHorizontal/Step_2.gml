/// @description Insert description here
// You can write your code in this editor

if(active) {

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

show_debug_message(x);
show_debug_message(y);
