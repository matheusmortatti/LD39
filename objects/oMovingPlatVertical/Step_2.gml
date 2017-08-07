/// @description Insert description here
// You can write your code in this editor

if(active) {
	if(!audioIsPlaying and vy!=0) {
		audio_play_sound(sndMovingPlat, 0, true);
		audioIsPlaying = true;
	}
	else if (vy == 0) {
		audio_stop_sound(sndMovingPlat);
		audioIsPlaying = false;
	}
		
		
	if(yTarget == y and alarm[0] <= 0) {
		spd = 0;
		alarm[0] = delay;
	}

	vy = sign(yTarget-y)*spd;

	y = Approach(y, yTarget, vy);
	
	if(place_meeting(x, y, oParSolid)) {
		while(place_meeting(x, y, oParSolid)) {
			y -= sign(vy);
		}
		
		if(alarm[0] <= 0) {
			spd = 0;
			alarm[0] = delay;
		}
	}
	
	//repeat(abs(vy)) {
	//	if(place_meeting(x, y + sign(vy), oParSolid) or y == yTarget)
	//		break;
			
	//	y += sign(vy);
	//}
	
	target = instance_place(x, y-1, oPlayer);
	if (target != noone) {
		target.y += vy;
		
		with(target) {
			if(place_meeting(x, y, oParSolid)) {
				while(place_meeting(x, y, oParSolid)) {
					y -= sign(other.vy);
				}
			}
		}
	}

}
else {
	audioIsPlaying=false;
	audio_stop_sound(sndMovingPlat);
}