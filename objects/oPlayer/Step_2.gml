/// Entity Step 2.0

/// EntityStep();

jumped = false;
landed = false;

if (vy < 1 && vy > -1)
    PlatformCheck();
else
    repeat(abs(vy)) {
        if (!PlatformCheck())
            y += sign(vy);
        else
            break;
    }

if (platformTarget) {
    if (!onGround)
        landed = true;
    
    if (landed)
        with (platformTarget) other.vy = 0;
    else
        with (platformTarget) other.vy = 0;
}

repeat(abs(vx)) {
    if (place_meeting(x + sign(vx), y, oParSolid) && !place_meeting(x + sign(vx), y - 1, oParSolid))
        y -= 1;
         
    if (place_meeting(x + sign(vx), y + 2, oParSolid) && !place_meeting(x + sign(vx), y + 1, oParSolid))
        y += 1;
      
    // Push block //
    if (place_meeting(x + sign(vx), y, oPushBlock)) {
        // Push slowly
        vx = clamp(vx, -1, 1);
            
        with (instance_place(x + sign(vx), y, oPushBlock)) {
            // UP slope
            if (place_meeting(x + sign(other.vx), y, oParSolid) && !place_meeting(x + sign(other.vx), y - 1, oParSolid))
                --y;
            
            // DOWN slope
            if (!place_meeting(x + sign(other.vx), y, oParSolid) && !place_meeting(x + sign(other.vx), y + 1, oParSolid) && place_meeting(x + sign(other.vx), y + 2, oParSolid))
                ++y;        

            if (!place_meeting(x + sign(other.vx), y, oParSolid))
                x += sign(other.vx); 
            else {
                other.h = 0;
                break;
            }        
        }
    } // End push block //          
          
    if (!place_meeting(x + sign(vx), y, oParSolid))
        x += sign(vx);
    else
        vx = 0;
}

