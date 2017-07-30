onGroundPrev = onGround;

if(place_meeting(x + lengthdir_x(speed + 1, direction - 90), y + lengthdir_y(speed + 1, direction - 90), oParSolid)) {
    onGround = true;
    delay = 0;
}
//else
    //onGround = false;

