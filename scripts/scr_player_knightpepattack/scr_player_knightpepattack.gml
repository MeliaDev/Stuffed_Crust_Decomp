function scr_player_knightpepattack() //scr_player_knightpepattack
{
    alarm[5] = 2
    alarm[7] = 60
    if (sprite_index == spr_knightpepattack)
    {
        if instance_exists(obj_swordhitbox)
        {
            if (obj_swordhitbox.bumpeffect == 0)
                hsp = (xscale * movespeed)
            else
                hsp = ((-xscale) * movespeed)
        }
        if (movespeed >= 0)
            movespeed -= 0.4
        if (floor(image_index) == (image_number - 1))
        {
            image_index = 0
            sprite_index = spr_knightpepidle
            state = (47 << 0)
        }
    }
    else
    {
        hsp = (xscale * movespeed)
        if (movespeed > 0)
        {
            if grounded
                movespeed -= 0.3
            else
                movespeed -= 0.2
        }
        if (floor(image_index) == (image_number - 1))
            image_index = (image_number - 1)
        if (movespeed <= 0)
        {
            movespeed = 0
            sprite_index = spr_knightpepidle
            state = (47 << 0)
        }
        if (scr_slope() && sprite_index != spr_knightpepthunder)
        {
            movespeed = 4
            knightmomentum = 0
            with (instance_place(x, (y + 1), obj_slope))
                other.xscale = (-sign(image_xscale))
            state = (38 << 0)
            sprite_index = spr_knightpepdownslope
            slope_buffer = 20
        }
        if (place_meeting((x + hsp), y, obj_solid) && (!(place_meeting((x + hsp), y, obj_destructibles))) && (!(place_meeting((x + hsp), y, obj_slope))))
            movespeed = 0
        if grounded
            doublejump = 0
        if (key_jump && grounded && vsp > 0)
        {
            if (movespeed <= 8)
                movespeed = 8
            vsp = -12
            state = (38 << 0)
            sprite_index = spr_knightpepdoublejump
            image_index = 0
        }
        if ((!grounded) && (!doublejump))
        {
            state = (47 << 0)
            sprite_index = spr_knightpepjump
            image_index = 0
        }
    }
    image_speed = 0.35
}

