// break up into pieces

var ww = sprite_get_width(sprite_index);
var hh = sprite_get_height(sprite_index)
var chunk = random_range(sprite_width/4, sprite_width/2);

for(var i = 0; i <= ww; i += chunk) {
    for(var j = 0; j < hh; j += chunk) {
        var piece = instance_create(x+i-chunk, y+j-chunk, oPiece);
        piece.spr = sprite_index;
        piece.xx = i;
        piece.yy = j;
        piece.size = chunk;
    }
}

