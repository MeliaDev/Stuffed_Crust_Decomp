if (room == hub_loadingscreen && state != 2)
{
    with (obj_player)
    {
        state = (95 << 0)
        sprite_index = spr_walkfront
        image_index = 0
    }
    if (!fadeoutcreate)
    {
        fadeoutcreate = 1
        with (obj_player)
        {
            ini_open_from_string(obj_savesystem.ini_str)
            var _intro = ini_read_real("Tutorial", "finished", 0)
            paletteselect = ini_read_real("Game", "palette", 1)
            var _texture = ini_read_string("Game", "palettetexture", "none")
            global.palettetexture = scr_get_texture_palette(_texture)
            ini_close()
            if _intro
            {
                targetRoom = tower_entrancehall
                targetDoor = "A"
                state = (98 << 0)
            }
            else
            {
                targetRoom = Finalintro
                targetDoor = "A"
                state = (18 << 0)
            }
        }
        with (instance_create(x, y, obj_fadeout))
        {
            gamestart = 1
            restarttimer = 1
        }
        icon_alpha = 0
        with (obj_achievementtracker)
        {
            achievement_get_steam_achievements(achievements_update)
            achievement_get_steam_achievements(achievements_notify)
        }
        with (instance_create(0, 0, obj_loadingscreen))
        {
            dark = 1
            group_arr = ["hubgroup"]
            offload_arr = ["menugroup"]
        }
    }
}
if (state != 0)
{
    showicon = 1
    icon_alpha = 3
}
else if showicon
{
    icon_alpha = Approach(icon_alpha, 0, 0.05)
    if (icon_alpha <= 0)
        showicon = 0
}
if showicon
{
    icon_index += 0.35
    if (icon_index > (icon_max - 1))
    {
        var t = frac(icon_index)
        icon_index = t
    }
}
