//is_ghost_active(ghost_name)
var return_value = false;
for (var i = 0; i < GhostManager_obj.ghost_count; i += 1)
{
    if (GhostManager_obj.ghost_names[i] == argument0)
    {
        return_value = GhostManager_obj.ghost_on[i];
    }
}

return return_value;
