//get_next_wall_in_direction(x_pos, y_pos, wall_dir)
var x_pos = floor(argument0/16)*16 + 8;
var y_pos = floor(argument1/16)*16 + 8;
var wall_dir = argument2;

var x_incr = cos(wall_dir/180*pi);
var y_incr = -sin(wall_dir/180*pi);
var next_wall = noone;

while(next_wall == noone)
{
    next_wall = instance_position(x_pos, y_pos, Wall_obj);
    x_pos += x_incr;
    y_pos += y_incr;
    
    if (x_pos > room_width || x_pos < 0 || y_pos > room_height || y_pos < 0)
    {
        show_debug_message("error trying to find next wall in direction!");
        break;
    }
}

return next_wall;
