vx = Approach(vx, 0, fric);
vy = Approach(vy, maxFall, grav);


repeat(abs(vx)) {
    if(place_meeting(x + sign(vx), y, oParSolid))
        break;
        
    x += sign(vx);
}

repeat(abs(vy)) {
    if(place_meeting(x, y+ sign(vy), oParSolid))
        break;
        
    y += sign(vy);
}

