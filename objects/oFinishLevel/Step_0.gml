/// @description Insert description here
// You can write your code in this editor

if (!instance_exists(oFxRoomGoTo) and place_meeting(x, y, oPlayer))
	instance_create(0, 0, oFxRoomGoTo);
