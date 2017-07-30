ROPE_LENGTH = irandom_range(3, 5)

for(var i = 1; i < ROPE_LENGTH; i++) {
	if(grid_place_meeting(x, y + i * sprite_height, 1)) {
		ROPE_LENGTH = i / 2;
		break;
	}
}

if(ROPE_LENGTH <= 2) {
	instance_destroy();
	exit;
}

offsetY = 0;
host = self;
nextRope = instance_create(x, y + offsetY, oRope);

attach = physics_joint_rope_create(host, nextRope, host.x, host.y, nextRope.x, nextRope.y, 5, false);
physics_joint_set_value(attach, phy_joint_damping_ratio, 1);
physics_joint_set_value(attach, phy_joint_frequency, 10);


with(nextRope) {
    link = other.attach;
    parent = other.id;
}

for(var i = 0; i < ROPE_LENGTH; i++) {
    offsetY += 5;
    lastRope = nextRope;
    nextRope = instance_create(x, y + offsetY, oRope);
    
    link = physics_joint_rope_create(lastRope, nextRope, lastRope.x, lastRope.y, nextRope.x, nextRope.y, 5, false);
    physics_joint_set_value(link, phy_joint_damping_ratio, 1);
    physics_joint_set_value(link, phy_joint_frequency, 10);
    
    with(nextRope) {
        link = other.link;
        parent = other.lastRope;
    }
}

// If there's a vine next to it, connect them
//var Vine = collision_circle(x, y, 50, oVineSpawner, false, true)
//if(instance_exists(Vine)) {
    //link = physics_joint_rope_create(Vine.nextRope, nextRope, Vine.nextRope.x, Vine.nextRope.y, nextRope.x, nextRope.y, 5, false);
    //physics_joint_set_value(link, phy_joint_damping_ratio, 1);
    //physics_joint_set_value(link, phy_joint_frequency, 10);
//}

