vx = Approach(vx, 0, airFric);
vy = Approach(vy, maxFall, grav);

image_angle = point_direction(x, y, x + vx, y + vy);

if(collision_line(x, y, x + vx, y + vy, oRope, false, false)) {
    with(instance_place(x, y, oRope)) {
        physics_joint_delete(link);
    }
}

x += vx;
y += vy;

