var test_cp = next_checkpoint;
var test_index = next_checkpoint_index;
var next_wall = get_next_wall_in_direction(x, y, direction);
//Step back
var next_wall_x = next_wall.x + 8 + cos(direction/180*pi + pi)*16;
var next_wall_y = next_wall.y + 8 - sin(direction/180*pi + pi)*16

if (collision_line(x, y, next_wall_x, next_wall_y, test_cp, true, true))
{
    test_index += 1;
    if (test_index > ds_list_size(CheckpointManager_obj.checkpoints)-1)
    {
        test_index = 0;
    }
    test_cp = ds_list_find_value(CheckpointManager_obj.checkpoints, test_index);
}

return predict_next_dir(next_wall_x, next_wall_y, direction, test_cp);
