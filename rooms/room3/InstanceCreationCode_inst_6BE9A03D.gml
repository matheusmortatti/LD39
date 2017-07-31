target = instance_create(x-2*16, y+8, oDoor);

target.yStart = target.y;
target.yEnd   = target.y-16;
target.yTarget = target.yEnd;

target.active = false;