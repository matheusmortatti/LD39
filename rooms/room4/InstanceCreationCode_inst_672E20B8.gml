target = instance_create(x+5*16, y + 8, oDoor);

target.yStart = target.y;
target.yEnd   = target.y-23*16;
target.yTarget = target.yEnd;

target.active = false;