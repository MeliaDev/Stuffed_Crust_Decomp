function scr_player_ratmountgrind() //scr_player_ratmountgrind
{
    hsp = movespeed
    vsp = 0
    move = (key_left + key_right)
    if (move != 0)
    {
        xscale = move
        movespeed = Approach(movespeed, (move * 7), 0.45)
        sprite_index = spr_lonegustavo_hangwalk
    }
    else
    {
        movespeed = Approach(movespeed, 0, 0.65)
        sprite_index = spr_lonegustavo_hang
    }
    image_speed = 0.35
    if (!(place_meeting(x, y, obj_grindrailslope)))
    {
        with (instance_place(x, y, obj_grindrail))
            other.y = y
    }
    if (move != 0)
    {
        var inst = instance_place((x + hsp), (y - 32), obj_grindrailslope)
        if (inst == noone)
            inst = instance_place((x + hsp), (y + 32), obj_grindrailslope)
        with (inst)
        {
            if (other.xscale == sign(image_xscale))
                other.vsp = -5
            else
                other.vsp = 5
        }
    }
    ds_list_clear(global.instancelist)
    if ((!(place_meeting(x, y, obj_grindrail))) && (!(place_meeting(x, y, obj_grindrailslope))))
    {
        state = (192 << 0)
        sprite_index = spr_player_ratmountgroundpoundfall
    }
    if (input_buffer_jump > 0)
    {
        input_buffer_jump = 0
        state = (192 << 0)
        if key_down
        {
            sprite_index = spr_player_ratmountgroundpoundfall
            vsp = 5
        }
        else
        {
            image_index = 0
            sprite_index = spr_player_ratmountgroundpound
            vsp = -13
        }
        jumpstop = 0
        jumpAnim = 1
    }
}

