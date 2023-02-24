if (monochrome)
{
    background_color = c_white;
    with (Wall_obj) { image_blend = c_black; }
    with (Checkpoint_obj) { image_blend = c_black; }
    with (Tracks_obj) { image_blend = c_black; }
    with (RaceUI_obj) { image_blend = c_black; }
    with (Racer_obj) { image_blend = c_black; }
}
else
{
    background_color = blue_color;
    with (Wall_obj) { image_blend = c_white; }
    with (Checkpoint_obj) { image_blend = c_white; }
    with (Tracks_obj) { image_blend = c_white; }
    with (RaceUI_obj) { image_blend = c_white; }
    with (Racer_obj) { image_blend = c_white; }
}
