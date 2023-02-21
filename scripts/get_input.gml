switch(cpu_type)
{
    case "player":
        space_pressed = keyboard_check_pressed(vk_space);
        space_released = keyboard_check_released(vk_space);
        break;
    default: //bronze
        space_pressed = false;
        space_released = false;
}

