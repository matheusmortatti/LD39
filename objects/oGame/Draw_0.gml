

if (instance_exists(oTouchCompatible)) {
    draw_sprite(sLeftArrow, 0, __view_get( e__VW.XView, 0 ) + 16, __view_get( e__VW.YView, 0 ) + 280);
    draw_sprite(sRightArrow, 0, __view_get( e__VW.XView, 0 ) + 96, __view_get( e__VW.YView, 0 ) + 280);   
    draw_sprite(sJumpButton, 0, __view_get( e__VW.XView, 0 ) + 640 - 64 - 16, __view_get( e__VW.YView, 0 ) + 280);
    draw_sprite(sAtkButton, 0, __view_get( e__VW.XView, 0 ) + 640 - 64 - 96, __view_get( e__VW.YView, 0 ) + 280); 
}

