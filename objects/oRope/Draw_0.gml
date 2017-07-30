if(parent != -1) {
    if(light)
        instance_create(x, y, oFxFire);
    draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, point_direction(x, y, parent.x, parent.y) + 90, c_white, image_alpha);
}

//physics_draw_debug();

