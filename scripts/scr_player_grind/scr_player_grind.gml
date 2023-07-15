function scr_player_grind() //scr_player_grind
{
    sprite_index = ((!skateboarding) ? spr_grind : spr_clown)
    image_speed = 0.35
    machhitAnim = 0
    crouchslideAnim = 1
    hsp = (xscale * movespeed)
    if (!(place_meeting(x, (y + 18), obj_grindrailslope)))
    {
        if (movespeed < 12)
        {
            if key_attack
                movespeed = Approach(movespeed, 12, 0.5)
            else
                movespeed = Approach(movespeed, 6, 0.125)
        }
    }
    else if key_down
    {
        var spd1 = 0.35
        var spd2 = 0.5
        if key_attack
        {
            spd1 = 0.5
            spd2 = 0.65
        }
        scr_player_addslopemomentum_grind(spd1, spd2)
    }
    else if (movespeed < 12)
    {
        if key_attack
            movespeed = Approach(movespeed, 12, 0.5)
        else
            movespeed = Approach(movespeed, 5, 0.125)
    }
    if ((!(place_meeting(x, (y + 18), obj_grindrail))) && (!(place_meeting(x, (y + 18), obj_grindrailslope))))
    {
        if (movespeed < 12 || skateboarding)
        {
            state = (104 << 0)
            if skateboarding
            {
                sprite_index = spr_clownfall
                image_index = 0
            }
            else
                sprite_index = spr_mach2jump
        }
        else
        {
            state = (121 << 0)
            sprite_index = spr_mach4
        }
    }
    if (place_meeting((x + xscale), y, obj_solid) && (!(place_meeting(x, (y + 18), obj_grindrailslope))) && (!(place_meeting(x, (y + 1), obj_slope))))
    {
        state = (106 << 0)
        hsp = ((-xscale) * 5)
        vsp = 1
    }
    if (input_buffer_jump > 0)
    {
        input_buffer_jump = 0
        with (instance_create(x, y, obj_jumpdust))
            image_xscale = other.xscale
        vsp = -11
        jumpstop = 0
        if (movespeed < 12 || skateboarding)
        {
            state = (104 << 0)
            if skateboarding
            {
                sprite_index = spr_clownjump
                image_index = 0
            }
            else
            {
                sprite_index = spr_mach2jump
                if (character != "S")
                {
                    if (ispeppino && hasjumped)
                        sprite_index = spr_player_airattackstart
                }
            }
        }
        else
        {
            state = (121 << 0)
            sprite_index = spr_mach3jump
            if (character != "S")
            {
                if (ispeppino && hasjumped)
                    sprite_index = spr_player_airattackstart
            }
        }
    }
    if (!instance_exists(obj_grindeffect))
        instance_create(x, y, obj_grindeffect)
}

