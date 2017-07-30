/// Generate

/***************************
//
// Create Path
//
***************************/

if(step == 0) {
    random_set_seed(current_time);
    
    // Choose position for the first room
    var row = 0 // top row
    var col = irandom(worldSizeX-3)+1; // Random place at top row
    
    iniRow = 0;
    iniCol = col;
    
    // First room is type 2
    rooms[col, row] = 1;
    
    var ended = false;
    while(!ended) {
        
        /**************
        /* Creates list of possible directions to take
        /* 1 = left
        /* 2 = down
        /* 3 = right
        /**************/
        var dirPos = ds_list_create();
        if(rooms[col, row] == 1) {
           ds_list_add(dirPos, 1, 3);
        }
        else if(rooms[col, row] == 2) {
            ds_list_add(dirPos, 1, 2, 3);
        }
        else if(rooms[col, row] == 3) {
            ds_list_add(dirPos, 1, 3);
        }
    
        var listSize = ds_list_size(dirPos);
        var remove = ds_list_create();
        
        // Removes non valid directions
        for(var i = 0; i < listSize; i++) {
            var val = dirPos[| i];
    
            if((val == 1 and col + 1 >= worldSizeX) or (val == 1 and rooms[col + 1, row] != 0)) {
                ds_list_add(remove, val);
            }
            else if((val == 3 and col - 1 <= -1) or (val == 3 and rooms[col - 1, row] != 0)) {
               ds_list_add(remove, val);
            }
            else if((val == 2 and row + 1 >= worldSizeY)) {
                ds_list_add(remove, val);
                ended = true;
            }
        }
        
        if(ended) break;
        
    
        for(var i = 0; i < ds_list_size(remove); i++) {
            ds_list_delete(dirPos, ds_list_find_index(dirPos, remove[| i]));
        }
        
        ds_list_destroy(remove);
        
        // Choose Direction
        var dir = -1;
        var lastRow = row;
        var lastCol = col;
        listSize = ds_list_size(dirPos);
        
        if(listSize != 0) {
            dir = irandom(listSize-1);
            if(dirPos[| dir] == 1) {
                lastCol = col;
                col++;
            }
            else if(dirPos[| dir] == 2) {
                lastRow = row;
                row++;
            }
            else if(dirPos[| dir] == 3) {
                lastCol = col;
                col--;
            }
    
            if(rooms[lastCol, lastRow] == 1 or rooms[lastCol, lastRow] == 3) {
                rooms[col, row] = choose(1, 2, 3);
            }
            else if(rooms[lastCol, lastRow] == 2) {
    
                if(dirPos[| dir] == 2) rooms[col, row] = 3;
                else rooms[col, row] = choose(1, 2, 3);
    
            }
        }
        // If there's no direction to go, overrides current room to accomodate down choice
        else {
    
            rooms[col, row] = 2;
        }
        
        ds_list_destroy(dirPos);
        
    }
    
    ds_list_destroy(dirPos);
    
    step++;
}
else if(step == 1) {
    /***************************
    //
    // Place Special Room
    //
    ***************************/
    
    var zeroRooms = ds_list_create();
    
    // Find all type-zero rooms
    for(var i = 0; i < worldSizeX; i++) {
        for(var j = 0; j < worldSizeY; j++) {
            if(rooms[i, j] == 0)
                ds_list_add(zeroRooms, i, j);
        }
    }
    
    // Choose randomly an index
    var special = irandom(ds_list_size(zeroRooms)/2 - 1);
    
    // Place special room
    rooms[ds_list_find_value(zeroRooms, 2*special), ds_list_find_value(zeroRooms, 2*special+1)] = 4;
    
    ds_list_destroy(zeroRooms);
    
    /***************************
    //
    // Create Level Grid
    //
    ***************************/
    
    global.LevelGrid = ds_grid_create(worldSizeX * roomSizeX, worldSizeY * roomSizeY);
    ds_grid_clear(global.LevelGrid, 0);
    
    // For every room
    for(var i = 0; i < worldSizeY; i++) {
        for(var j = 0; j < worldSizeX; j++) {
            var file = file_text_open_read("rooms" + string(rooms[j, i]) + ".txt");
            
            if(file != -1) {  
            
                var roomType = file_text_read_real(file);
                var numberOfRooms = file_text_read_real(file);
                var roomSize = file_text_read_real(file);
                
                // Go to a random room template inside the file
                var r = irandom(numberOfRooms - 1)
                FileSkipLines(file, roomSizeY * r + 2 + sign(r));
                
                var roomGrid = ds_grid_create(roomSizeX, roomSizeY);
                ds_grid_clear(roomGrid, 0);
                
                // For every tile in the chosen room
                for(var k = 0; k < roomSizeY; k++) {
                    for(var l = 0; l < roomSizeX; l++) {
                    
                    
                        var v = file_text_read_real(file);
                        if(v != 0) {
                            roomGrid[# l, k] =  v;
                            
                            // Place Ground Obstacle
                            if(v == 5) {
                                var file2 = file_text_open_read("room_plats.txt");
                                var nRooms = file_text_read_real(file2);
                                
                                // Skip lines to go to the right template
                                var r = irandom(nRooms - 1);
                                FileSkipLines(file2, 3 * r + 2 + abs(r));
                                for(var a = 0; a < 3; a++) {
                                    for(var b = 0; b < 5; b++) {
                                        roomGrid[# l + b, k + a] = file_text_read_real(file2);
                                    }
                                }
                                
                                file_text_close(file2);
                            }
                            // Place Air Obstacle
                            else if(v  == 6) {
                                var file2 = file_text_open_read("room_plats.txt");
                                var nRooms = file_text_read_real(file2);
                                
                                // Skip lines to go to the right template
                                var r = irandom(nRooms - 1);
                                FileSkipLines(file2, 3 * r + 2 + abs(r));
                                
                                for(var a = 0; a < 3; a++) {
                                    for(var b = 0; b < 5; b++) {
                                        roomGrid[# l + b * TILE_WIDTH, k + a * TILE_HEIGHT] = file_text_read_real(file2);
                                    }
                                }
                                
                                file_text_close(file2);
                            }
                        }
                    }
                }
                
                // 50/50 chance of mirroring room
                if(Chance(0.5))
                    MirrorGrid(roomGrid);
                
                // Copy room into level grid
                ds_grid_add_grid_region(global.LevelGrid, roomGrid, 0, 0, roomSizeX-1, roomSizeY-1, j * roomSizeX, i * roomSizeY);
                
                ds_grid_destroy(roomGrid);
            }       
            file_text_close(file)  
        }
    }
    
    // Close up the World
    for(var i = 0; i < worldSizeX * roomSizeX; i++) {
        global.LevelGrid[# i, 0] = 1;
        global.LevelGrid[# i, worldSizeY * roomSizeY - 1] = 1;
    }
    
    for(var i = 0; i < worldSizeY * roomSizeY; i++) {
        global.LevelGrid[# 0, i] = 1;
        global.LevelGrid[# worldSizeX * roomSizeX - 1, i] = 1;
    }
    
    step++;
}
// Place the geometry in a few frames (stepSize controls how many you place each frame)
else if(step == 2) {
    /***************************
    //
    // Place Tiles
    //
    ***************************/

	repeat(stepSize) {
        PlaceTile(stepX * TILE_WIDTH, stepY * TILE_HEIGHT, ds_grid_get(global.LevelGrid, stepX, stepY));
            
        // Decorative stuff
            
        // Place Vine or Lantern
        if(global.LevelGrid[# stepX, stepY] == 1 and global.LevelGrid[# stepX, stepY + 1] == 0) {
            if(Chance(0.3)) {
                if(Chance(0.5))
                    instance_create(stepX * TILE_WIDTH + random(16), (stepY+1) * TILE_HEIGHT, oRopeSpawner);
                else
                    instance_create(stepX * TILE_WIDTH + random(16), (stepY+1) * TILE_HEIGHT, oLanternSpawner);
            }
        }
            
        // Place Decorative Grass
        if(global.LevelGrid[# stepX, stepY] == 1 and global.LevelGrid[# stepX, stepY - 1] == 0) {
            if(Chance(0.2)) {
                instance_create(stepX * TILE_WIDTH + random(16), stepY * TILE_HEIGHT, choose(oFGGrass1, oFGGrass2));
                instance_create(stepX * TILE_WIDTH + random(16), stepY * TILE_HEIGHT, choose(oFGGrass1, oFGGrass2));
                instance_create(stepX * TILE_WIDTH + random(16), stepY * TILE_HEIGHT, choose(oFGGrass1, oFGGrass2));
                instance_create(stepX * TILE_WIDTH + random(16), stepY * TILE_HEIGHT, choose(oBGGrass1, oBGGrass2));
                instance_create(stepX * TILE_WIDTH + random(16), stepY * TILE_HEIGHT, choose(oBGGrass1, oBGGrass2));
                instance_create(stepX * TILE_WIDTH + random(16), stepY * TILE_HEIGHT, choose(oBGGrass1, oBGGrass2));
            }
        }
		
		// Place pickup
		PlacePickup(global.LevelGrid, stepX, stepY);
		//instance_create(stepX * TILE_WIDTH, stepY * TILE_HEIGHT, oArrowPickup);
			
		stepY++;
	
		if(stepY >= worldSizeY * roomSizeY) {
			stepY = 0;
			stepX++;
		}
	
	
		if(stepX >= worldSizeX * roomSizeX) {
			stepX = 0;
			step++;
			break;
		}
	}
}
// Create Player
else if(step == 3) {
	 instance_create(TILE_WIDTH * (roomSizeX / 2 + roomSizeX * iniCol), TILE_HEIGHT *(roomSizeY / 2 + roomSizeY * iniRow), oPlayer_new);
     step++;
}

__view_set( e__VW.HView, 0, 16 * worldSizeY * roomSizeY );
__view_set( e__VW.WView, 0, 16 * worldSizeX * roomSizeX );

/* */
/*  */
