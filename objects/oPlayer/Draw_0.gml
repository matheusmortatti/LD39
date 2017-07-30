// Draw sprite depending on player state


var sRun, sIdle, sJump, sCharging;
var pMask = mask_index;

if(energy > 80) {
	sRun = sPlayerRun55;
	sIdle = sPlayerIdle55;
	sJump = sPlayerJump55;
	sCharging = sPlayerCharging55;
	
	mask_index = sPlayerMask55;
	if(place_meeting(x, y, oParSolid))
		mask_index = pMask;
}
else if(energy <= 80 and energy > 60) {
	sRun = sPlayerRun45;
	sIdle = sPlayerIdle45;
	sJump = sPlayerJump45;
	sCharging = sPlayerCharging45;
	
	mask_index = sPlayerMask45;
	if(place_meeting(x, y, oParSolid))
		mask_index = pMask;
}
else if(energy <= 60 and energy > 40) {
	sRun = sPlayerRun35;
	sIdle = sPlayerIdle35;
	sJump = sPlayerJump35;
	sCharging = sPlayerCharging35;
	
	mask_index = sPlayerMask35;
	if(place_meeting(x, y, oParSolid))
		mask_index = pMask;
}
else if(energy <= 40 and energy > 20) {
	sRun = sPlayerRun25;
	sIdle = sPlayerIdle25;
	sJump = sPlayerJump25;
	sCharging = sPlayerCharging25;
	
	mask_index = sPlayerMask25;
	if(place_meeting(x, y, oParSolid))
		mask_index = pMask;
}
else if(energy <= 20 and energy > 0) {
	sRun = sPlayerRun15;
	sIdle = sPlayerIdle15;
	sJump = sPlayerJump15;
	sCharging = sPlayerCharging15;
	
	mask_index = sPlayerMask15;
	if(place_meeting(x, y, oParSolid))
		mask_index = pMask;
}

switch (state) {
    case IDLE: 
        image_speed = 0.2;
            
        if (blocking)
            sprite_index = sPlayerIdleShield;
        else
            sprite_index = sIdle;
    break;
        
    case RUN: 
        image_speed = 0.33; 
            
        if (blocking)
            sprite_index = sPlayerRunShield;
        else
            sprite_index = sRun;
    break;
        
    case JUMP:
        // Mid jump   
        if (!(place_meeting(x, y + 2, oParSolid) && vy != 0) && vy >= -1.0 && vy <= 1.0) {  
            if (blocking)
                sprite_index = sPlayerJumpMShield;
            else
                sprite_index = sJump;  
        } else { 
            // Rise + fall
            if (vy <= 0) {
                if (blocking)
                    sprite_index = sPlayerJumpUShield;
                else  
                    sprite_index = sJump;  
            } else {
                if (blocking)
                    sprite_index = sPlayerJumpDShield;
                else
                    sprite_index = sJump;
            }
        }
             
        // When against a wall   
        if (cRight || cLeft)
            if (blocking)
                sprite_index = sPlayerSlideShield;
            else
                sprite_index = sIdle;
    break;
	
	case CHARGE:
		sprite_index = sCharging;
	break;
}


// Draw player
if (onGround)
    draw_sprite_ext(sprite_index, image_index, x, y + (16 - 16 * yscale) * 0.25, facing * xscale, yscale, 0, c_white, image_alpha);    
else
    draw_sprite_ext(sprite_index, image_index, x, y, facing * xscale, yscale, 0, c_white, image_alpha);

