target = instance_create(x + 10*16, y + 3*16, oMovingPlatHorizontal);

target.xStart = target.x;
target.xEnd = target.x + 18 * 16; 
target.xTarget = target.xEnd;

target.active = false;