function scr_player_current() //scr_player_current
{
    if (!(place_meeting(x, y, obj_current)))
        state = (0 << 0)
    if (sprite_index == spr_barrelroll || sprite_index == spr_player_barrelfall || sprite_index == spr_player_barrelland || sprite_index == spr_player_barrelidle || sprite_index == spr_player_barrelmove || sprite_index == spr_player_barreljump)
        sprite_index = spr_player_barrelslipnslide
    else
        sprite_index = spr_player_slipnslide
    image_speed = 0.35
}

