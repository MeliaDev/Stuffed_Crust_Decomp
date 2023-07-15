function scr_player_motorcycle() //scr_player_motorcycle
{
    hsp = (xscale * movespeed)
    move = (key_left + key_right)
    if (grounded || (!jumped))
        movespeed = Approach(movespeed, 13, 0.5)
    else
        movespeed = Approach(movespeed, 8, 0.5)
    image_speed = 0.35
    if grounded
        jumped = 0
    if (grounded && input_buffer_jump > 0 && vsp > 0)
    {
        scr_fmod_soundeffect(jumpsnd, x, y)
        input_buffer_jump = 0
        vsp = -11
        jumped = 1
        jumpstop = 0
        sprite_index = spr_player_pizzacarjump
        image_index = 0
    }
    if ((!grounded) && (!key_jump2) && vsp < 0 && (!jumpstop))
    {
        vsp /= 10
        jumpstop = 1
    }
    if (move == (-xscale) && grounded)
    {
        if (sprite_index != spr_player_pizzacarskid)
        {
            image_index = 0
            sprite_index = spr_player_pizzacarskid
        }
        if (movespeed > 8)
            movespeed = 8
    }
    if (!instance_exists(obj_chainsawpuff))
    {
        with (instance_create((x - (12 * xscale)), y, obj_chainsawpuff))
            sprite_index = spr_pizzaslug_smoke
    }
    if ((place_meeting((x + sign(hsp)), y, obj_solid) || scr_solid_slope((x + sign(hsp)), y)) && (!(place_meeting((x + sign(hsp)), y, obj_destructibles))) && (!(place_meeting((x + sign(hsp)), y, obj_slope))))
    {
        jumpstop = 0
        vsp = -11
        state = (5 << 0)
        sprite_index = spr_mach2jump
        var i = 0
        repeat (sprite_get_number(spr_pizzacar_debris) - 1)
        {
            with (create_debris(x, y, 4058))
            {
                image_index = i
                vsp = irandom_range(-7, -12)
            }
            i++
        }
    }
    switch sprite_index
    {
        case spr_player_pizzacarjump:
            if (floor(image_index) == (image_number - 1))
                sprite_index = spr_player_pizzacarfall
            break
        case 3879:
            if (grounded && vsp > 0)
            {
                sprite_index = spr_player_pizzacarland
                image_index = 0
            }
            break
        case 4444:
            movespeed = Approach(movespeed, 3, 0.25)
            if (floor(image_index) == (image_number - 1))
            {
                xscale *= -1
                sprite_index = spr_player_pizzacar
            }
            break
        case 3661:
            if (floor(image_index) == (image_number - 1))
            {
                if (move == (-xscale) && grounded)
                    xscale *= -1
                sprite_index = spr_player_pizzacar
            }
            break
        default:
            if ((!grounded) && vsp > 0)
                sprite_index = spr_player_pizzacarfall
    }

}

