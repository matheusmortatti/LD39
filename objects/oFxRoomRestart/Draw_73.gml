// Draw End

if (image_alpha >= 1) {
    // Don't leave room while paused
    //with (oPause2)
    //    instance_destroy();
    //with (oPauseSuccess2)
    //    instance_destroy();

    room_restart();
}

draw_set_alpha(image_alpha);
draw_rectangle_colour(0, 0, room_width, room_height, c_black, c_black, c_black, c_black, false);
draw_set_alpha(1.0);

image_alpha += 0.02;

