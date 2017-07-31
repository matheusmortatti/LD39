/// @description Insert description here
// You can write your code in this editor

if(active) {
	yTarget = yEnd;
}
else
	yTarget = yStart;

vy = sign(yTarget-y)*spd;

y = Approach(y, yTarget, vy);

if (target != noone) {
	target.y += vy;
}
