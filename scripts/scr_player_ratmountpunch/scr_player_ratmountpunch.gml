function scr_player_ratmountpunch() //scr_player_ratmountpunch
{
    image_speed = (abs(movespeed) / 16)
    hsp = movespeed
    move = (key_left + key_right)
    landAnim = 0
    sprite_index = spr_lonegustavo_punch
    if grounded
        movespeed = Approach(movespeed, (xscale * 4), 0.1)
    ratmountpunchtimer--
    if (ratmountpunchtimer < 0 && ((!key_slap) || gustavohitwall))
    {
        sprite_index = spr_lonegustavo_walk
        state = (191 << 0)
        if (hsp != 0)
        {
            dir = sign(hsp)
            xscale = dir
        }
    }
    if (place_meeting((x + hsp), y, obj_solid) && (!(place_meeting((x + hsp), y, obj_slope))) && (!(place_meeting((x + hsp), y, obj_destructibles))))
    {
        fmod_event_one_shot_3d("event:/sfx/pep/bumpwall", x, y)
        GamepadSetVibration(0, 0.4, 0.2)
        ratmountpunchtimer = 10
        gustavohitwall = 1
        instance_create((x + hsp), y, obj_bangeffect)
        movespeed /= 1.5
        movespeed *= -1
    }
    if ((key_down && grounded && (!gustavohitwall)) || scr_solid(x, y))
        state = (260 << 0)
    if (key_down && (!grounded) && (!gustavohitwall))
    {
        movespeed = hsp
        state = (197 << 0)
        image_index = 0
        sprite_index = spr_lonegustavo_groundpoundstart
    }
    if (punch_afterimage > 0)
        punch_afterimage--
    else
    {
        punch_afterimage = 5
        with (create_mach3effect(x, y, sprite_index, image_index, 1))
            image_xscale = other.xscale
    }
}

