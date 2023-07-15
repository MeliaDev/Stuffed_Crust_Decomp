if (global.switchbuffer == 0 && global.panic == escape)
{
    with (other)
    {
        hsp = 0
        vsp = 0
        visible = false
        state = (146 << 0)
    }
    fmod_event_one_shot("event:/sfx/misc/pepgusswitch")
    create_particle(x, y, (9 << 0))
    sprite_index = spr_gustavoswitch1
    with (obj_player1)
    {
        if (character == "N" || (character == "P" && ispeppino == 0))
        {
            spr_palette = spr_noisepalette
            fontpalettespr = spr_palette_font_noise
            snd_voiceok = fmod_event_create_instance("event:/sfx/voice/noisepositive")
            snd_voicehurt = fmod_event_create_instance("event:/sfx/voice/noisenegative")
        }
        else
        {
            spr_palette = spr_peppalette
            fontpalettespr = spr_font_palette
            snd_voiceok = fmod_event_create_instance("event:/sfx/voice/ok")
            snd_voicehurt = fmod_event_create_instance("event:/sfx/voice/hurt")
        }
        machreset = 1
    }
    with (obj_tv)
    {
        isgustavo = 0
        tv_bg_sprite = spr_tv_bgfinal
        tv_bg_shadow = 4399
        if (global.leveltosave == "street")
        {
            dotransition = 1
            tv_bg_index = 13
        }
        if (global.leveltosave == "forest")
            tv_bg_index = 10
        if (global.leveltosave == "mansion")
        {
            tv_bg_sprite = spr_tv_bgfinal_bonus
            tv_bg_shadow = 4398
            tv_bg_index = 0
        }
    }
    global.switchbuffer = 200
    playerid = other.id
    with (obj_peppinoswitch)
    {
        playerid = other.playerid
        sprite_index = switchspr2
        if (switchspr2 == spr_playerN_bombend)
            image_index = 24
        else
            image_index = 0
    }
    with (instance_create(0, 0, obj_charswitch_intro))
    {
        if (obj_player.character == "N" || (obj_player.character == "P" && obj_player.ispeppino == 0))
            spr = spr_backtonoise
        else
            spr = spr_backtopeppino
    }
}
