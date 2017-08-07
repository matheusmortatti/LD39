/// Rope Climb

//if(place_meeting(x, y, oRope) and (keyboard_check_pressed(vk_up) or keyboard_check_pressed(vk_down))) {
//    ropeAttach = instance_place(x, y, oRope);
//    state = CLIMB;
//}

if(energy > 95) {
	jumpHeight = jumpHeightMax;
}
else if(energy <= 95 and energy > 60) {
	jumpHeight = jumpHeightMax;
}
else if(energy <= 60 and energy > 40) {
	jumpHeight = jumpHeightMax/1.2;
}
else if(energy <= 40 and energy > 20) {
	jumpHeight = jumpHeightMax/1.4;
}
else if(energy <= 20 and energy > 0) {
	jumpHeight = jumpHeightMax/1.5;
}

if(place_meeting(x, y, oParSolid)) instance_destroy();

var onGroundPrev = onGround;

event_inherited();

if (onGround && !onGroundPrev) {
    for (var i = 0; i < 4; ++i) {
        instance_create(x + random_range(-8, 8), y + 8 + random_range(-2, 2), oParticlePlayer);
    }
	audio_play_sound(sndFall, 0, false);
    
    xscale = 1.33;
    yscale = 0.67;
}