/// @description Insert description here
// You can write your code in this editor

if(!instance_exists(oPlayer)) follow = noone;
else						  follor = oPlayer;

x += (xTo - x)/10;
y += (yTo - y)/10;

x = clamp(x, 0 + resolutionX/2, room_width-resolutionX/2);
y = clamp(y, 0 + resolutionY/2, room_height-resolutionY/2);

if (follow != noone) {
	xTo = follow.x;
	yTo = follow.y;
}

var vm = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
camera_set_view_mat(camera, vm);
