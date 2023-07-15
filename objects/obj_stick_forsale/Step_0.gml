if (!first)
{
    if (distance_to_object(obj_player) < 300 && obj_player.y > (y - 100))
    {
        first = 1
        ini_open_from_string(obj_savesystem.ini_str)
        ini_write_real(save, "first", 1)
        obj_savesystem.ini_str = ini_close()
        with (instance_create(obj_stick_target.x, (camera_get_view_y(view_camera[0]) - 100), obj_stick))
        {
            state = (135 << 0)
            sprite_index = spr_stick_helicopter
            maxscore = other.maxscore
            save = other.save
        }
    }
}
