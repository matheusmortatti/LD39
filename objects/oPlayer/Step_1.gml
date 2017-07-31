/// Rope Climb

//if(place_meeting(x, y, oRope) and (keyboard_check_pressed(vk_up) or keyboard_check_pressed(vk_down))) {
//    ropeAttach = instance_place(x, y, oRope);
//    state = CLIMB;
//}

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