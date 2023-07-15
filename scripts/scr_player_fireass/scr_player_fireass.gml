function scr_player_fireass() //scr_player_fireass
{
    image_speed = 0.35
    alarm[5] = 2
    alarm[7] = 60
    move = (key_left + key_right)
    with (instance_place(x, (y + vsp), obj_ratblock))
        instance_destroy()
    if place_meeting((x + hsp), y, obj_solid)
        image_xscale *= -1
    if (sprite_index == spr_fireass || sprite_index == spr_scaredjump1 || sprite_index == spr_scaredjump2)
    {
        if (floor(image_index) == (image_number - 1) && sprite_index == spr_fireass)
            create_particle(x, (y + 25), (7 << 0), 0)
        if (sprite_index == spr_fireass)
        {
            if (fireasseffect > 0)
                fireasseffect--
            else
            {
                fireasseffect = 7
                create_particle(x, (y + 40), (1 << 0), 0)
            }
            if (firemouth_afterimage > 0)
                firemouth_afterimage--
            else
            {
                firemouth_afterimage = 8
                with (create_firemouth_afterimage(x, y, sprite_index, (image_index - 1), xscale))
                    playerid = other.id
            }
        }
        hsp = movespeed
        if (vsp > 0)
            fireasslock = 0
        if (fireasslock == 0)
        {
            if (move != 0)
            {
                if (move == xscale)
                    movespeed = Approach(movespeed, (xscale * 8), 0.5)
                else
                    movespeed = Approach(movespeed, 0, 0.5)
                if (movespeed <= 0)
                    xscale = move
            }
            else
                movespeed = Approach(movespeed, 0, 0.1)
        }
        if place_meeting(x, (y + 1), obj_haystack)
            vsp = -20
        else if (grounded && vsp > 0 && (!(place_meeting(x, (y + 1), obj_ratblock))))
        {
            movespeed = 6
            if (sprite_index == spr_fireass)
                sprite_index = spr_fireassground
            else if (sprite_index == spr_scaredjump1 || sprite_index == spr_scaredjump2)
            {
                movespeed = 0
                sprite_index = spr_scaredjump3
            }
            else
            {
                movespeed = 0
                landAnim = 0
                alarm[5] = 2
                alarm[7] = 60
                hurted = 1
                state = (0 << 0)
                sprite_index = spr_idle
                image_index = 0
            }
            image_index = 0
        }
    }
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_scaredjump1)
        sprite_index = spr_scaredjump2
    if (sprite_index == spr_fireassground)
    {
        hsp = (xscale * movespeed)
        if (movespeed > 0)
            movespeed -= 0.25
        if (floor(image_index) == (image_number - 1))
        {
            if (move != 0)
            {
                movespeed = 0
                landAnim = 0
                alarm[5] = 2
                alarm[7] = 60
                hurted = 1
                state = (0 << 0)
                sprite_index = spr_idle
                image_index = 0
            }
            else
                sprite_index = spr_fireassend
        }
    }
    if (sprite_index == spr_fireassend || sprite_index == spr_scaredjump3)
    {
        hsp = (xscale * movespeed)
        if (movespeed > 0)
            movespeed -= 0.25
        if (floor(image_index) == (image_number - 1) || move != 0)
        {
            movespeed = 0
            landAnim = 0
            alarm[5] = 2
            alarm[7] = 60
            hurted = 1
            state = (0 << 0)
            sprite_index = spr_idle
            image_index = 0
        }
    }
}

