
if(onGround) {
    // Find an edge
    if(!place_meeting(x + lengthdir_x(speed + 1, direction - 90), y + lengthdir_y(speed + 1, direction - 90), oParSolid)) {
        direction -= 90;
        
        x += hspeed;
        y += vspeed;
        
        move_contact_solid(direction - 90, speed)
    }
    // Hit a wall
    else if(place_meeting(x + lengthdir_x(speed + 1, direction + 90), y + lengthdir_y(speed + 1, direction + 90), oParSolid)) {
        direction += 90;
        
        move_contact_solid(direction - 90, speed + 1);
    }
    
 
    switch(direction) {
        case 0:
            vx = 1;
            vy = 0;
            break;
        case 90:
            vx = 0;
            vy = -1;
            break;
        case 180:
            vx = -1;
            vy = 0;
            break;
        case 270:
            vx = 0;
            vy = 1;
            break;
    }
}
else {
    vy = Approach(vy, maxFall, grav);
}

x += vx;
y += vy;



