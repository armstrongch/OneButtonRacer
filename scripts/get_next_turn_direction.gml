var wall_ahead = get_next_wall_in_direction(x, y, direction);

var step_back_x = wall_ahead.x + 8 - cos(direction/180*pi)*16;
var step_back_y = wall_ahead.y + 8 + sin(direction/180*pi)*16;

var left_dir = direction + 90;
var right_dir = direction - 90;

var left_wall = get_next_wall_in_direction(step_back_x, step_back_y, left_dir);
var right_wall = get_next_wall_in_direction(step_back_x, step_back_y, right_dir);

var left_dist = point_distance(step_back_x, step_back_y, left_wall.x, left_wall.y);
var right_dist = point_distance(step_back_x, step_back_y, right_wall.x, right_wall.y);

if (left_dist < right_dist)
{
    return right_dir; 
}
else
{
    return left_dir;
}

