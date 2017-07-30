vx = Approach(vx, 0, 0.05);
vy = Approach(vy, 0, 0.1);
//image_alpha = Approach(image_alpha, 0, alphaSpd);
radius = Approach(radius, 0, 0.2);

if(radius == 0)
    instance_destroy();
    
    
x += vx;
y += vy;

