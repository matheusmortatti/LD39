/// Generate

// size of the world
worldSizeX = 3;
worldSizeY = 3;

// Size of each room
roomSizeX  = 16;
roomSizeY  = 8;

stepX = 0;
stepY = 0;
stepSize = 30;

// Initialize array
for(var i = 0; i < worldSizeX; i++) {
    for(var j = 0; j < worldSizeY; j++) {
        rooms[i, j] = 0;
    }
}

step = 0;

