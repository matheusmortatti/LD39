/// PlacePickup(grid, x, y)

var grid = argument[0];
var xx = argument[1];
var yy = argument[2];

/*******************************************************
 *
 *
 * More chance to get pickup in a confined area
 *
 *
********************************************************/
 
var chance = 0.0;

if(grid[# xx, yy - 1] == 1) {
	chance += 0.2;
}
if(grid[# xx + 1, yy] == 1) {
	chance += 0.2;
}
if(grid[# xx - 1, yy] == 1) {
	chance += 0.2;
}

if(grid[# xx, yy] == 1 or grid[# xx, yy + 1] == 0) {
	chance = -1;
}

if(Chance(chance)) instance_create(xx * TILE_WIDTH, yy * TILE_HEIGHT, oArrowPickup);