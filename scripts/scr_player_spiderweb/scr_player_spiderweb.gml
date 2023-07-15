function scr_player_spiderweb() //scr_player_spiderweb
{
    hsp = 0
    vsp = 0
    movespeed = 0
    move = (key_left + key_right)
    image_speed = 0.35
    if (move != 0)
        xscale = move
    if instance_exists(webID)
    {
        x = webID.x
        y = (webID.y - 4)
    }
    if key_jump
    {
        if instance_exists(webID)
        {
            with (webID)
                event_user(0)
        }
        vsp = -13
        movespeed = (webspeed + 2)
        webspeed = 0
        jumpstop = 0
        if (movespeed > 18)
            movespeed = 18
        if key_attack
        {
            if (movespeed >= 12)
            {
                sprite_index = spr_mach4
                state = (121 << 0)
            }
            else
            {
                if (movespeed >= 8)
                    sprite_index = spr_mach2jump
                else
                    sprite_index = spr_jump
                state = (92 << 0)
            }
        }
        else
        {
            sprite_index = spr_fall
            state = (92 << 0)
        }
        image_index = 0
        jumpAnim = 1
    }
    else
    {
        sprite_index = spr_facestomp
        webspeed -= 0.125
    }
}

