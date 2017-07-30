/// @description Insert description here
// You can write your code in this editor

if(active) {

	if(yTarget == y and alarm[0] <= 0) {
		spd = 0;
		alarm[0] = delay;
	}

	vy = sign(yTarget-y)*spd;

	y = Approach(y, yTarget, vy);
	
	//repeat(abs(vy)) {
	//	if(place_meeting(x, y + sign(vy), oParSolid) or y == yTarget)
	//		break;
			
	//	y += sign(vy);
	//}

	if (target != noone) {
		target.y += vy;
	}

}

show_debug_message(x);
show_debug_message(y);