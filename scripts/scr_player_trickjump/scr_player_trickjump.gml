function scr_player_trickjump() //scr_player_trickjump
{
    if (punch_afterimage > 0)
        punch_afterimage--
    else
    {
        punch_afterimage = 5
        with (create_mach3effect(x, y, sprite_index, image_index, 1))
        {
            image_xscale = other.xscale
            playerid = other.id
        }
    }
    if (sprite_index != spr_supertaunt1 && sprite_index != spr_supertaunt2 && sprite_index != spr_supertaunt3 && sprite_index != spr_supertaunt4 && sprite_index != spr_supertaunt5)
    {
        hsp = (movespeed * xscale)
        image_speed = 0.35
        if (character != "S" && sprite_index == spr_trickjump && floor(image_index) == (image_number - 1))
            image_index = (image_number - 1)
        if (key_taunt2 && ramp)
        {
            trickjumpvsp = vsp
            trickjumpmovespeed = movespeed
            trickjumphsp = hsp
            trickjumpsprite = sprite_index
            trickjumpindex = image_index
            vsp = 0
            movespeed = 0
            hsp = 0
            randomize_animations([spr_supertaunt1, spr_supertaunt2, spr_supertaunt3, spr_supertaunt4, spr_supertaunt5])
            image_index = 0
            ramp_points++
            var ramppointsnd = fmod_event_create_instance("event:/stuffed/sfx/jetset/start")
            with (instance_create(x, y, obj_trickjump_notif))
            {
                fmod_event_instance_play(ramppointsnd)
                fmod_event_instance_set_parameter(ramppointsnd, "state", clamp((other.ramp_points - 1), 0, 6), 1)
            }
        }
    }
    else
    {
        image_speed = 0.8
        if (floor(image_index) == (image_number - 1))
        {
            vsp = trickjumpvsp
            movespeed = trickjumpmovespeed
            hsp = trickjumphsp
            sprite_index = trickjumpsprite
            image_index = trickjumpindex
        }
        else
        {
            vsp = 0
            movespeed = 0
            hsp = 0
        }
    }
    if (scr_solid((x + xscale), y) && (!scr_slope()) && (scr_solid_slope((x + sign(hsp)), y) || place_meeting((x + sign(hsp)), y, obj_solid)) && (!(place_meeting((x + sign(hsp)), y, obj_destructibles))))
    {
        state = (106 << 0)
        image_index = 0
        fmod_event_one_shot_3d("event:/sfx/pep/splat", x, y)
        sprite_index = spr_wallsplat
    }
    if (ramp_buffer > 0)
        ramp_buffer--
    if (grounded && ramp_buffer <= 0)
    {
        image_speed = 0.5
        if (sprite_index == spr_trickjump)
        {
            sprite_index = spr_rollgetup
            if (movespeed < 12)
                state = (104 << 0)
            else
                state = (121 << 0)
        }
        else
        {
            ramp_points = 0
            fmod_event_one_shot_3d("event:/sfx/pep/groundpound", x, y)
            state = (111 << 0)
            sprite_index = spr_bodyslamland
            image_index = 0
        }
        ramp = 0
    }
}

