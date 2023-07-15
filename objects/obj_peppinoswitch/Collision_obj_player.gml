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
    sprite_index = switchspr1
    with (obj_player1)
    {
        spr_palette = spr_ratmountpalette
        fontpalettespr = spr_font_palette
        snd_voiceok = fmod_event_create_instance("event:/sfx/voice/gusok")
        snd_voicehurt = fmod_event_create_instance("event:/sfx/voice/gushurt")
        machreset = 1
    }
    global.switchbuffer = 200
    playerid = other.id
    with (obj_gustavoswitch)
    {
        sprite_index = spr_gustavoswitch2
        image_index = 0
    }
    with (obj_tv)
    {
        isgustavo = 1
        tv_bg_sprite = spr_tv_bgfinal
        tv_bg_shadow = 4399
        if (global.leveltosave == "street")
        {
            dotransition = 1
            bgalpha = 1
            tv_bg_sprite = spr_tv_bgfinal_bonus
            tv_bg_shadow = 4398
            tv_bg_index = 2
        }
        if (global.leveltosave == "forest")
            tv_bg_index = 12
        if (global.leveltosave == "mansion")
            tv_bg_index = 18
    }
    with (instance_create(0, 0, obj_charswitch_intro))
        spr = spr_gustavo_intro
}
