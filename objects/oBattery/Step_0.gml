/// @description Insert description here
// You can write your code in this editor

if (energy >= full_energy and target != noone) {
	target.active = true;
}
else if(target != noone)
	target.active = false;

if(energy == 0)
	sprite_index = sBattery03;
else if(energy > 0 and energy <= full_energy/2)
	sprite_index = sBattery13;
else if(energy > full_energy/2 and energy < full_energy)
	sprite_index = sBattery23;
else if(energy == full_energy)
	sprite_index = sBattery33;
