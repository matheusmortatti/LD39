/// MirrorGrid(grid)

var grid = argument[0];
var sizeX = ds_grid_width(grid);
var sizeY = ds_grid_height(grid);

for(var j = 0; j < sizeY; j++) {
    for(var i = 0; i < sizeX / 2; i++) {
        var a = grid[# i, j];
        grid[# i, j] = grid[# sizeX-i-1, j];
        grid[# sizeX-i-1, j] =  a;
    }
}
