with(PauseManager_obj)
{
    player_x = Player_obj.x
    player_y = Player_obj.y
    player_dir = Player_obj.direction;
    instance_deactivate_object(Tracks_obj);
    instance_deactivate_object(Racer_obj);
    paused = true;
}
