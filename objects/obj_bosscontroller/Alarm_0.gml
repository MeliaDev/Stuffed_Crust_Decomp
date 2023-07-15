with (obj_bosskeyspawn)
{
    ini_open_from_string(obj_savesystem.ini_str)
    var _spawn = 1
    if ini_read_real(save, "bosskey", 0)
        _spawn = 0
    ini_close()
    if _spawn
    {
        with (obj_player1)
        {
            if (state == (144 << 0))
            {
                state = (0 << 0)
                isgustavo = 0
            }
        }
        with (instance_create(x, -100, obj_bosskey))
        {
            save = other.save
            y_to = other.y
        }
    }
    else
    {
        with (other)
        {
            state = (98 << 0)
            with (obj_hpeffect)
                spd = 16
        }
    }
}
