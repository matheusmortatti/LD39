/// grid_place_meeting(x, y, type)

var xx = argument[0];
var yy = argument[1];
var type = argument[2];

var xp = x;
var yp = y;

x = xx;
y = yy;

var x_meeting = (global.LevelGrid[# bbox_right div TILE_WIDTH, bbox_top div TILE_HEIGHT] == type) || 
                (global.LevelGrid[# bbox_left div TILE_WIDTH, bbox_top div TILE_HEIGHT] == type);
                
var y_meeting = (global.LevelGrid[# bbox_right div TILE_WIDTH, bbox_bottom div TILE_HEIGHT] == type) || 
                (global.LevelGrid[# bbox_left div TILE_WIDTH, bbox_bottom div TILE_HEIGHT] == type);
                
x = xp;
y = yp;

return x_meeting || y_meeting;
