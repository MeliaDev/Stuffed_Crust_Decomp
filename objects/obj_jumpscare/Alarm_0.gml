state++
if (state == 1)
{
    alarm[0] = 100
    GamepadSetVibration(0, 1, 1, 0.9)
    instance_destroy(obj_kidspartybg)
    instance_destroy(obj_bazooka)
    with (obj_player1)
        state = (146 << 0)
    scr_monster_deactivate(0)
}
else if (state == 2)
{
    sprite_index = spr_tvstatic
    image_index = (sprite_get_number(spr_tvstatic) - 1)
    image_speed = 0
    with (obj_player)
    {
        if check_player_coop()
        {
            state = (225 << 0)
            x = roomstartx
            y = roomstarty
        }
    }
    warbg_stop()
    scr_monster_deactivate()
}
