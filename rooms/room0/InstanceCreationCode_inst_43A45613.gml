target = instance_create(x+4*16, y , oDoor);

target.yStart = target.y;
target.yEnd   = target.y-16;
target.yTarget = target.yEnd;

target.active = false;