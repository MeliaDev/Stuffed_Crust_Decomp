switch state
{
    case (0 << 0):
        sprite_index = spr_meatball_roll
        hsp = (image_xscale * 5)
        if place_meeting((x + sign(hsp)), y, obj_solid)
            image_xscale *= -1
        if (obj_player1.state == (111 << 0))
        {
            state = (92 << 0)
            hsp = 0
            vsp = -12
            sprite_index = spr_meatball_dead
            if (x != obj_player1.x)
                image_xscale = sign((obj_player1.x - x))
        }
        break
    case (92 << 0):
        if (grounded && vsp > 0)
            state = (0 << 0)
        break
}

mask_index = spr_meatball_roll
scr_collide()
