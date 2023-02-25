var direction_rad = direction/180*pi;

var about_to_hit_checkpoint = place_meeting(
    x + cos(direction_rad)*speed*2,
    y - sin(direction_rad)*speed*2,
    next_checkpoint);

var about_to_hit_wall = place_meeting(
    x + cos(direction_rad)*speed*2,
    y - sin(direction_rad)*speed*2,
    Wall_obj);
    
var inside_checkpoint = place_meeting(x, y, Checkpoint_obj);

var next_wall = get_next_wall_in_direction(x, y, direction);
var dist_to_next_wall = point_distance(x, y, next_wall.x+8, next_wall.y+8);

var x_dist_to_next_checkpoint = abs(x - next_checkpoint.x + next_checkpoint.image_xscale*16/2);
var y_dist_to_next_checkpoint = abs(y - next_checkpoint.y + next_checkpoint.image_yscale*16/2);

var dist_to_next_checkpoint;
if (direction % 180 == 0)
{
    dist_to_next_checkpoint = x_dist_to_next_checkpoint;
}
else
{
    dist_to_next_checkpoint = y_dist_to_next_checkpoint;
}

space_pressed = false;
space_released = false;   
switch(cpu_type)
{
    case "player":
        space_pressed = keyboard_check_pressed(vk_space);
        space_released = keyboard_check_released(vk_space);
        break;
    case "silver":
        if (!braking && about_to_hit_checkpoint) { space_pressed = true; }
        if (braking && about_to_hit_wall) { space_released = true; }
        break;
    case "gold":
        if (!braking && about_to_hit_checkpoint) { space_pressed = true; }
        if (braking && !about_to_hit_checkpoint && !inside_checkpoint) { space_released = true; }
        break;
    case "platinum":
        var calc_brake_dist = brake_dist();
        var braking_dist_to_next_checkpoint = dist_to_next_checkpoint + 24 < calc_brake_dist * 0.75;
        if (!braking && braking_dist_to_next_checkpoint)
        {
            space_pressed = true;
        }
        if (braking && cpu_hit_checkpoint_flag && !inside_checkpoint)
        {
            space_released = true;
        }
        debug_text = "cpu_hit_checkpoint_flag: " + string(cpu_hit_checkpoint_flag);
        break;
    case "ultra":
        break;
    case "bronze":
    default:
        //do nothing lol
        break;
}

