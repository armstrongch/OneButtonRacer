if (monochrome)
{
    background_color = c_white;
    with (Wall_obj) { image_blend = c_black; }
    with (Checkpoint_obj) { image_blend = c_black; }
    with (Tracks_obj) { image_blend = c_black; }
    with (RaceUI_obj) { image_blend = c_black; }
    with (Racer_obj) { image_blend = c_white; }
}
else
{
    background_color = blue_color;
    with (Wall_obj) { image_blend = ColorManager_obj.yellow_color; }
    with (Checkpoint_obj) { image_blend = ColorManager_obj.yellow_color; }
    with (Tracks_obj) { image_blend = ColorManager_obj.yellow_color; }
    with (RaceUI_obj) { image_blend = ColorManager_obj.yellow_color; }
    with (Racer_obj) { image_blend = c_white; }
}
