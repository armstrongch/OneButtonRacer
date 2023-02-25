var x_pos = argument0;
var y_pos = argument1;
var dir = argument2;

checkpoints = ds_list_create();

global.overlapping = false;
var counter = 0;
while (!global.overlapping /*&& counter < 10*/)
{
    show_debug_message("Create Checkpoint x_pos, y_pos, dir: " 
        + string(x_pos) + ", " + string(y_pos) + ", " + string(dir));
    
    var checkpoint = create_checkpoint(x_pos, y_pos, dir);
    
    x_pos = checkpoint.x + checkpoint.image_xscale*16/2;
    y_pos = checkpoint.y + checkpoint.image_yscale*16/2;
    dir = checkpoint.direction;
    
    with (checkpoint)
    {
        if collision_point(x + image_xscale*16/2, y + image_yscale*16/2, Checkpoint_obj, true, true) 
        {
            global.overlapping = true;
            instance_destroy();
        }
    }
    
    if (!global.overlapping)
    {
        ds_list_add(checkpoints, checkpoint);
    }
    
    counter += 1;
}
