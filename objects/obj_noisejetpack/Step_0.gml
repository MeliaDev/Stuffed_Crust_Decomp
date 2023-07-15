switch state
{
    case (46 << 0):
        if (cutscenebuffer > 0)
            cutscenebuffer--
        else
        {
            state = (135 << 0)
            instance_destroy(effectid)
        }
        break
    case (135 << 0):
        var ty = (playerid.y + 30)
        y = Approach(y, ty, movespeed)
        if (abs((y - ty)) <= 50)
            movespeed = Approach(movespeed, 0, 0.1)
        if (y == ty || movespeed <= 0)
        {
            create_particle(x, y, (9 << 0))
            scr_sound_multiple("event:/sfx/misc/collect", x, y)
            state = (8 << 0)
            cutscenebuffer = 70
            flamebuffer = 0
            orangealpha = 1.5
        }
        break
    case (8 << 0):
        if (orangealpha > 0)
            orangealpha -= 0.08
        if (flamebuffer > 0)
            flamebuffer--
        else
        {
            flamebuffer = 8
            repeat (3)
                instance_create(x, y, obj_firemouthflame)
        }
        if (cutscenebuffer > 0)
            cutscenebuffer--
        else
        {
            with (obj_music)
            {
                if (music != noone)
                    fmod_event_instance_set_parameter(music.event, "state", 2, 1)
            }
            global.noisejetpack = 1
            global.combotime = 60
            with (playerid)
            {
                state = (146 << 0)
                if (character == "N" || (character == "P" && (!ispeppino)))
                {
                    sprite_index = spr_playerN_dab
                    image_speed = 0.2
                }
                else
                {
                    sprite_index = spr_player_poweredup
                    image_speed = 0.35
                }
                image_index = 0
            }
            repeat (20)
            {
                with (obj_firemouthflame)
                {
                    hsp = 24
                    vsp = 24
                }
            }
            cutscenebuffer = 100
            state = (146 << 0)
        }
        break
    case (146 << 0):
        if (flamebuffer > 0)
            flamebuffer--
        else
        {
            flamebuffer = 8
            repeat (3)
            {
                with (instance_create(x, y, obj_firemouthflame))
                {
                    hsp *= 1.5
                    vsp *= 1.5
                }
            }
        }
        if (cutscenebuffer > 0)
            cutscenebuffer--
        else
        {
            with (obj_music)
            {
                if (music != noone)
                    fmod_event_instance_set_parameter(music.event, "state", 1, 1)
            }
            playerid.state = (0 << 0)
            playerid.landAnim = 0
            playerid.flash = 1
            instance_destroy()
            create_transformation_tip(lang_get_value("jetpack2tip"), "jetpack2")
        }
        break
}

if (state != (0 << 0))
{
    if (playerid.sprite_index == spr_playerN_dab)
    {
        with (playerid)
        {
            if (floor(image_index) == (image_number - 1))
            {
                image_index = (image_number - 1)
                image_speed = 0
            }
        }
    }
}
