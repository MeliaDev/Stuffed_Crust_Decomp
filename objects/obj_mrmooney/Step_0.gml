if (sprite_index == spr_mrmooney_idle)
{
    showmoney = place_meeting(x, y, obj_player)
    if (showmoney && obj_player1.key_up2 && (global.pigtotal - global.pigreduction) >= maxscore)
    {
        sprite_index = spr_mrmooney_smile
        fmod_event_one_shot_3d("event:/sfx/misc/kashing", x, y)
        instance_destroy(uparrowID)
        ini_open_from_string(obj_savesystem.ini_str)
        ini_write_real("w5stick", "mooneyunlocked", 1)
        obj_savesystem.ini_str = ini_close()
        gamesave_async_save()
        notification_push((57 << 0), [room])
        with (obj_palettedresser)
        {
            var i = 0
            while (i < array_length(palettes))
            {
                if (palettes[i][0] == "mooney")
                {
                    palettes[i][1] = 1
                    break
                }
                else
                {
                    i++
                    continue
                }
            }
        }
        instance_destroy(obj_pigtotal)
    }
}
else
    showmoney = 0
money_y = Wave(-5, 5, 2, 2)
