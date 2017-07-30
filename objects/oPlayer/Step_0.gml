/// Movement

// Input //////////////////////////////////////////////////////////////////////

var kLeft, kRight, kUp, kDown, kJump, kJumpRelease, kHoldShoot, kBlock, kRollL, kRollR, tempAccel, tempFric;

kLeft        = keyboard_check(vk_left)  || gamepad_axis_value(0, gp_axislh) < -0.4;
kRight       = keyboard_check(vk_right) || gamepad_axis_value(0, gp_axislh) >  0.4;
kUp          = keyboard_check(vk_up)    || gamepad_axis_value(0, gp_axislv) < -0.4;
kDown        = keyboard_check(vk_down)  || gamepad_axis_value(0, gp_axislv) >  0.4;

kJump        = keyboard_check_pressed(vk_space)  || gamepad_button_check_pressed(0, gp_face1);
kJumpRelease = keyboard_check_released(vk_space) || gamepad_button_check_released(0, gp_face1);

kHoldShoot   = keyboard_check(ord("X"))          || gamepad_button_check(0, gp_face3);
kShoot       = keyboard_check_released(ord("X")) || gamepad_button_check_released(0, gp_face3);
kBlock       = keyboard_check(ord("C"))          || gamepad_button_check(0, gp_face2);
kRollL       = keyboard_check_pressed(ord("A"))  || gamepad_button_check_pressed(0, gp_shoulderlb);
kRollR       = keyboard_check_pressed(ord("D"))  || gamepad_button_check_pressed(0, gp_shoulderrb);

// Movement ///////////////////////////////////////////////////////////////////

// Apply the correct form of acceleration and friction
if (onGround) {  
    tempAccel = groundAccel;
    tempFric  = groundFric;
} else {
    tempAccel = airAccel;
    tempFric  = airFric;
}

// Reset wall cling
if ((!cRight && !cLeft) || onGround) {
    canStick = true;
    sticking = false;
}   

// Cling to wall
if (((kRight && cLeft) || (kLeft && cRight)) && canStick && !onGround) {
    alarm[0] = clingTime;
    sticking = true; 
    canStick = false;       
}

// Handle gravity
if (!onGround) {
    if ((cLeft || cRight) && vy >= 0) {
        // Wall slide
        vy = Approach(vy, vyMax, gravSlide);
    } else {
        // Fall normally
        vy = Approach(vy, vyMax, gravNorm);
    }
}

if (!IsAny(state, SHOOT, CLIMB, CHARGE)) {
    // Left 
    if (kLeft && !kRight && !sticking) {
        facing = -1;
        state  = RUN;
        
        // Apply acceleration left
        if (vx > 0)
            vx = Approach(vx, 0, tempFric);   
        vx = Approach(vx, -vxMax, tempAccel);
    // Right
    } else if (kRight && !kLeft && !sticking) {
        facing = 1;
        state  = RUN;
        
        // Apply acceleration right
        if (vx < 0)
            vx = Approach(vx, 0, tempFric);   
        vx = Approach(vx, vxMax, tempAccel);
    }
}



// Friction
if (!kRight && !kLeft) {
    vx = Approach(vx, 0, tempFric);
    
    if (!IsAny(state, CLIMB, SHOOT))
        state = IDLE;
} 
       
// Wall jump
if (kJump && cLeft && !onGround) {
    yscale = 1.33;
    xscale = 0.67;
            
    if (kLeft) {
        vy = -jumpHeight * 1.2;
        vx =  jumpHeight * .66;
    } else {
        vy = -jumpHeight * 1.1;
        vx =  vxMax; 
    }  
}

if (kJump && cRight && !onGround) {
    yscale = 1.33;
    xscale = 0.67;
    
    if (kRight) {
        vy = -jumpHeight * 1.2;
        vx = -jumpHeight * .66;
    } else {
        vy = -jumpHeight * 1.1;
        vx = -vxMax;
    }  
}

if(place_meeting(x, y, oRope) and (kUp or kDown)) {
    ropeAttach = instance_place(x, y, oRope);
    state = CLIMB;
}

// Rope Climbing
if(state == CLIMB) {
    vx = 0;
    vy = 0;
    
    var nextAttach = instance_place(x, y, oRope)
    ropeAttach = nextAttach;
    if(nextAttach != noone and nextAttach != ropeAttach)
        ropeAttach = nextAttach;
        
    if(instance_exists(ropeAttach)) {
        x = ropeAttach.x;
        
        if(kUp and !kDown) {
            vy = -2.0;
        }
        else if(!kUp and kDown) {
            vy = 2.0;
        }
        else {
            
        }
        
        if(kLeft and !kRight) {
           // with(ropeAttach)
               // physics_apply_impulse(phy_position_x, phy_position_y, -10, 0)
        }
        else if(!kLeft and kRight) {
            //with(ropeAttach)
                //physics_apply_impulse(phy_position_x, phy_position_y, 10, 0)
        }
        else {
            
        }
    }
    else {
        state = JUMP;
    }
    
    if(kJump) {
        state = JUMP;
        vy = -jumpHeight;
        ropeAttach = noone;
    }
    
}
 
// Jump 
if (kJump) { 
    if (onGround) {
        // Fall thru platform
        if (kDown) {
            if (place_meeting(x, y + 1, oParJumpThru))
                ++y;
        } else {
            vy = -jumpHeight;
            
            yscale = 1.33;
            xscale = 0.67;
        }
    }
// Variable jumping
} else if (kJumpRelease) { 
    if (vy < 0)
        vy *= 0.25;
}

// Jump state
if (!onGround and state != CLIMB)
    state = JUMP;
    
// Run particles
else if (random(100) > 85 && abs(vx) > 0.5)
    instance_create(x, y + 8, oParticlePlayer);

// Swap facing during wall slide
if (cRight && !onGround)
    facing = -1;
else if (cLeft && !onGround)
    facing = 1;

// Roll
//if (onGround && !attacking) {
//    if (state != ROLL) {
//       if (kRollL) {
//            facing = -1;
//            
//            image_index  = 0;
//            image_speed  = 0.5;
//            sprite_index = sPlayerRoll;
//            
//            state = ROLL;
//        } else if (kRollR) {
//            facing = 1;
//            
//            image_index  = 0;
//            image_speed  = 0.5;
//            sprite_index = sPlayerRoll;
//            
//            state = ROLL;
//        }
//    }
//}

// Roll speed
//if (state == ROLL) {
//    vx = facing * 6;
    
    // Break out of roll
//    if (!onGround || (cLeft || cRight)) {
//        state = IDLE;
//        if (!attacking)
//            alarm[1] = -1;
//    }
//}
    
//// Shoot Arrow
//if (kHoldShoot) {
//    state = SHOOT;
//}
//else if(kShoot) {
//    state = IDLE;
//}

//if(kShoot) {
//    with(instance_create(x, y, oArrow)) {
//        vx = cos(degtorad(other.arrowAngle)) * 20;
//        vy = -sin(degtorad(other.arrowAngle)) * 20;
//        image_angle = point_direction(x, y, x + vx, y + vy);
//    }
//}

//if(state == SHOOT) {

//    if(onGround) vx = Approach(vx, 0, tempFric);
    
//    // Eight directions (probably there's a smarter way to do this)
    
//    if(kRight and !kUp and !kLeft and !kDown) {         // right
//        arrowAngle = 0;
//        facing = 1;
//    }
//    else if(!kRight and kUp and !kLeft and !kDown) {    // up
//        arrowAngle = 90;
//    }
//    else if(!kRight and !kUp and kLeft and !kDown) {    // left
//        arrowAngle = 180;
//        facing = -1;
//    }
//    else if(!kRight and !kUp and !kLeft and kDown) {    // down
//        arrowAngle = 270;
//    }
//    else if(kRight and kUp and !kLeft and !kDown) {     // right + up
//        arrowAngle = 45;
//        facing = 1;
//    }
//    else if(kRight and !kUp and !kLeft and kDown) {     // right + down
//        arrowAngle = 315;
//        facing = 1;
//    }
//    else if(!kRight and kUp and kLeft and !kDown) {     // left + up
//        arrowAngle = 135;
//        facing = -1;
//    }
//    else if(!kRight and !kUp and kLeft and kDown) {     // left + down
//        arrowAngle = 225;
//        facing = -1;
//    }
//}

/// Squash + stretch

xscale = Approach(xscale, 1, 0.05);
yscale = Approach(yscale, 1, 0.05);

/// Hitbox

//with (oPlayerAtkBox)
//    instance_destroy();

// Dash out of roll
//if (sprite_index == sPlayerRollSlash) {    
//    with (instance_create(x, y, oPlayerAtkBox)) {
//        bboxleft  = min(other.x + (5 * other.facing), other.x + (24 * other.facing));
//        bboxright = max(other.x + (5 * other.facing), other.x + (24 * other.facing));
//        
//        bboxtop    = other.y - 1;
//        bboxbottom = other.y + 8; 
//    }
//}
    
//// Jab
//if (sprite_index == sPlayerJab && round(image_index) > 0) {    
//    with (instance_create(x, y, oPlayerAtkBox)) {
//        bboxleft  = min(other.x + (5 * other.facing), other.x + (30 * other.facing));
//        bboxright = max(other.x + (5 * other.facing), other.x + (30 * other.facing));
        
//        bboxtop    = other.y - 1;
//        bboxbottom = other.y + 8; 
//    }
//}

/// Lantern

//with(instance_place(x, y, oRope)) {
//    physics_apply_impulse(phy_position_x, phy_position_y, other.vx * 10, other.vy * 10)
//}

// Reduce size

show_debug_message(energy);

// Give energy to battery
if(!IsAny(state, CLIMB) and place_meeting(x, y, oBattery) and keyboard_check(ord("Z"))) {
	state = CHARGE;
	var bTarget = instance_place(x, y, oBattery);
	
	if (bTarget.full_energy > bTarget.energy) {
		bTarget.energy += 1;
		energy -= 1;
	}
}
else if(!IsAny(state, CLIMB) and place_meeting(x, y, oBattery) and keyboard_check(ord("X"))) {
	state = CHARGE;
	var bTarget = instance_place(x, y, oBattery);
	
	if (0 < bTarget.energy) {
		bTarget.energy -= 1;
		energy += 1;
	}
}
else if(!IsAny(state, CLIMB) and place_meeting(x, y, oChargingPad) and keyboard_check(ord("X"))) {
	energy += 1;
	state = CHARGE;
}
else if(state == CHARGE)
	state = INTER;

if (vx != 0 or vy != 0) {
	energy -= depletion;
}

energy = clamp(energy, 0, 100);

if(energy <= 0) {
	instance_destroy();
	instance_create(0, 0, oFxRoomRestart);
}