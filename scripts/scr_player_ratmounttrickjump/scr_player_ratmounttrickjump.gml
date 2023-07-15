function scr_player_ratmounttrickjump() //scr_player_ratmounttrickjump
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
    if (sprite_index != spr_player_ratmountsupertaunt)
    {
        hsp = (movespeed * xscale)
        image_speed = 0.35
        if (sprite_index == spr_player_ratmountwalljump && floor(image_index) == (image_number - 1))
            sprite_index = spr_player_ratmountfall
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
            sprite_index = spr_player_ratmountsupertaunt
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
        movespeed = 0
        if (ratmount_movespeed >= 14)
        {
            var _bump = ledge_bump((vsp >= 0 ? 32 : 22))
            if _bump
            {
                fmod_event_one_shot_3d("event:/sfx/pep/groundpound", x, y)
                state = (106 << 0)
                if brick
                    sprite_index = spr_player_ratmountbump
                else
                    sprite_index = spr_lonegustavo_bump
                image_index = 0
                instance_create((x + (xscale * 15)), (y + 10), obj_bumpeffect)
                hsp = ((-xscale) * 4)
                vsp = -5
                with (obj_camera)
                {
                    shake_mag = 4
                    shake_mag_acc = (5 / room_speed)
                }
            }
        }
    }
    if (ramp_buffer > 0)
        ramp_buffer--
    if (grounded && ramp_buffer <= 0)
    {
        fmod_event_one_shot_3d("event:/sfx/pep/groundpound", x, y)
        state = (191 << 0)
        sprite_index = spr_player_ratmountland
        image_index = 0
        movespeed = hsp
        landAnim = 1
        ramp = 0
    }
}

