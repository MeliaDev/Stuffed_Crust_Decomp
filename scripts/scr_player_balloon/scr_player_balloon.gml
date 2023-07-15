function scr_player_balloon() //scr_player_balloon
{
    if (character == "N" || (character == "P" && (!ispeppino)))
        sprite_index = spr_playerN_ratballoon
    else
        sprite_index = spr_player_ratballoon
    hsp = movespeed
    move = (key_left + key_right)
    if (!isgustavo)
        vsp = -5
    else
    {
        vsp = Approach(vsp, 4, 0.35)
        if brick
        {
            fmod_event_one_shot_3d("event:/sfx/rat/grabeat", x, y)
            state = (200 << 0)
        }
    }
    image_speed = 0.35
    if (move != 0)
        movespeed = Approach(movespeed, (move * 6), 0.35)
    else
        movespeed = Approach(movespeed, 0, 0.35)
    if (place_meeting((x + hsp), y, obj_solid) && (!(place_meeting((x + hsp), y, obj_slope))))
        movespeed = 0
    if (balloonbuffer > 0)
        balloonbuffer--
    else
    {
        create_particle(x, (y - 20), (9 << 0), 0)
        instance_create(x, (y - 20), obj_balloongrabbableeffect)
        state = (92 << 0)
        sprite_index = spr_fall
        jumpAnim = 0
    }
    if key_jump
    {
        create_particle(x, (y - 20), (9 << 0), 0)
        instance_create(x, (y - 20), obj_balloongrabbableeffect)
        image_index = 0
        jumpstop = 0
        jumpAnim = 1
        vsp = -11
        if isgustavo
        {
            state = (192 << 0)
            sprite_index = spr_player_ratmountgroundpound
            movespeed = abs(movespeed)
        }
        else
        {
            state = (92 << 0)
            sprite_index = spr_jump
            movespeed = abs(movespeed)
        }
    }
}

