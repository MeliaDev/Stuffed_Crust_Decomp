if (!noise_grabbed)
{
    if grabbed
        linethrown = 0
    if linethrown
    {
        vsp = 0
        hsp = hithsp
        if (place_meeting((x + sign(hithsp)), y, obj_solid) || (place_meeting(x, y, obj_player) && obj_player.state != (42 << 0)))
        {
            instance_destroy()
            if obj_player1.flash
                obj_player1.flash = 0
            scr_hurtplayer(obj_player1)
        }
    }
    event_inherited()
    with (obj_noiseboss)
    {
        if (state == (148 << 0) && ((other.x < (x - 16) && other.y > (y - 50)) || place_meeting(x, (y - other.hsp), other) || place_meeting(x, y, other)))
        {
            if (!other.noise)
            {
                other.noise_grabbed = 1
                other.thrown = 0
                sprite_index = spr_playerN_golfswing
                image_index = 0
            }
            else
                scr_noise_do_hurt(other.id)
        }
    }
    if ((!linethrown) && (!thrown) && noise && grounded && vsp > 0)
    {
        instance_destroy()
        if obj_player1.flash
            obj_player1.flash = 0
        scr_hurtplayer(obj_player1)
    }
}
else
{
    with (obj_noiseboss)
    {
        other.x = (x + (20 * image_xscale))
        other.y = y
        if (sprite_index != spr_playerN_golfswing || floor(image_index) >= 9)
        {
            other.noise = 1
            other.noise_grabbed = 0
            other.image_xscale = (-image_xscale)
            if (wastedhits < 10)
            {
                other.hsp = (image_xscale * 8)
                other.vsp = -17
            }
            else if (wastedhits < 12)
            {
                other.hithsp = (image_xscale * 12)
                other.hsp = other.hithsp
                other.linethrown = 1
            }
            else
            {
                other.hsp = (image_xscale * 2)
                other.vsp = -14
            }
        }
    }
}
