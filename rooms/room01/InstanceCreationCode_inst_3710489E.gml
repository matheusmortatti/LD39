target = instance_create(x+6*16, y+64+8, oDoor);

target.yStart = target.y;
target.yEnd   = target.y-10;
target.yTarget = target.yEnd;

target.active = false;