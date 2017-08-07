target = instance_create(x+12*8, y + 8, oDoor);

target.yStart = target.y;
target.yEnd   = target.y-32;
target.yTarget = target.yEnd;

target.active = false;