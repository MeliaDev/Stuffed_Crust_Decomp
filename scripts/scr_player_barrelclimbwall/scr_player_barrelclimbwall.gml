function scr_player_barrelclimbwall() //scr_player_barrelclimbwall
{
    move = (key_left + key_right)
    hsp = 0
    if (sprite_index == spr_player_barrelslipnslide && floor(image_index) == (image_number - 1))
        sprite_index = spr_barrelroll
    if ((!key_attack) && (!(place_meeting(x, (y + 1), obj_current))) && (!(scr_solid(x, (y - 16)))) && (!(scr_solid(x, (y - 32)))))
    {
        mask_index = spr_player_mask
        if (!(place_meeting(x, y, obj_solid)))
        {
            movespeed = 0
            state = (114 << 0)
            sprite_index = spr_player_barrelfall
        }
    }
    if (grounded && vsp > 0)
    {
        state = (116 << 0)
        xscale *= -1
        movespeed = (xscale * 8)
    }
    with (instance_place(x, (y + vsp), obj_destructibles))
        instance_destroy()
}

