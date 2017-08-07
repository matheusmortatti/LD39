instance_create(0, 0, oFxRoomRestart);

repeat(5) {
	instance_create(x+random_range(-8,8), y+random_range(-8,8), oParticlePlayer);
}

