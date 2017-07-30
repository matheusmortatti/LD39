// Draw End

if (image_alpha >= 1) {
    // Don't leave room while paused
    //with (oPause2)
    //    instance_destroy();
    //with (oPauseSuccess2)
    //    instance_destroy();
    
    if (target == -1)
		if(room_next(room) != -1)
			room_goto_next();
		else
			room_goto(room_first);
    else
        room_goto(target);
}

draw_set_alpha(image_alpha);
draw_rectangle_colour(0, 0, room_width, room_height, c_black, c_black, c_black, c_black, false);
draw_set_alpha(1.0);

image_alpha += 0.02;


