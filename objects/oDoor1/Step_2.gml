/// @description Insert description here
// You can write your code in this editor

if(active) {
	xTarget = xEnd;
}
else
	xTarget = xStart;

vx = sign(xTarget-x)*spd;

x = Approach(x, xTarget, vx);


target = instance_place(x, y-1, oPlayer);
if (target != noone) {
	target.x += vx;
}
