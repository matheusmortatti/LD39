// Handle sub-pixel movement
cx += vx + vx_carry;
cy += vy + vy_carry;
vxNew = round(cx);
vyNew = round(cy);
cx -= vxNew;
cy -= vyNew;

vx_carry = 0;
vy_carry = 0;

EntityStep();

// Pit death
if (bbox_right < 0 || bbox_left > room_width || bbox_top > room_height || bbox_bottom < 0)
    instance_destroy();
    


