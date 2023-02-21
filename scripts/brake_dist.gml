//returns the distance you will travel before stopping if you start braking now
var current_speed = speed;
var dist_travelled = 0;

while(current_speed > 0)
{
    dist_travelled += current_speed;
    current_speed -= accel_speed
}

return dist_travelled;
