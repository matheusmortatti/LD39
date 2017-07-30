draw_set_color(c_red);
draw_set_font(f_font);

for(var i = 0; i < worldSizeX; i++) {
    for(var j = 0; j < worldSizeY; j++) {
        draw_text(i * roomSizeX * TILE_WIDTH, j * roomSizeY * TILE_HEIGHT, string_hash_to_newline(string(rooms[i, j])));
    }
}

