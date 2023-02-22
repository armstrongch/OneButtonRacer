//predict_next_dir(x_pos, y_pos, current_dir, next_cp)
var x_pos = argument0;
var y_pos = argument1;
var current_dir = argument2;
var next_cp = argument3;

var new_dir = -1;

var left_dir = current_dir + 90;
var right_dir = current_dir - 90;

var left_dir_incr_x = cos(left_dir/180*pi)*8;
var left_dir_incr_y = sin(left_dir/180*pi)*8 * -1;

var right_dir_incr_x = left_dir_incr_x * -1;
var right_dir_incr_y = left_dir_incr_y * -1;

var cp_center_x = next_cp.x + next_cp.image_xscale*16/2;
var cp_center_y = next_cp.y + next_cp.image_yscale*16/2;

var left_dist = point_distance(x_pos + left_dir_incr_x, y_pos + left_dir_incr_y, cp_center_x, cp_center_y);
var right_dist = point_distance(x_pos + right_dir_incr_x, y_pos + right_dir_incr_y, cp_center_x, cp_center_y);

if (left_dist < right_dist)
{
    new_dir = left_dir;
}
else
{
    new_dir = right_dir;
}

return new_dir;
