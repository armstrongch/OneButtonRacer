var next_checkpoint = ds_list_find_value(CheckpointManager_obj.checkpoints, next_checkpoint_index);

var left_dir = direction + 90;
var right_dir = direction - 90;

var left_dir_incr_x = cos(left_dir/180*pi)*8;
var left_dir_incr_y = sin(left_dir/180*pi)*8 * -1;

var right_dir_incr_x = left_dir_incr_x * -1;
var right_dir_incr_y = left_dir_incr_y * -1;

var cp_center_x = next_checkpoint.x + next_checkpoint.image_xscale*16/2;
var cp_center_y = next_checkpoint.y + next_checkpoint.image_yscale*16/2;

var left_dist = point_distance(x + left_dir_incr_x, y + left_dir_incr_y, cp_center_x, cp_center_y);
var right_dist = point_distance(x + right_dir_incr_x, y + right_dir_incr_y, cp_center_x, cp_center_y);

if (left_dist < right_dist)
{
    direction = left_dir;
}
else
{
    direction = right_dir;
}
speed = charge;
charge = 0;
