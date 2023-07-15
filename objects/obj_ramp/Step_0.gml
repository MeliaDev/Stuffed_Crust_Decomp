if used
    image_index = 1
else
    image_index = 0
var s = 16
if place_meeting(x, (y - s), obj_player)
{
    with (obj_player)
    {
        var by = 4
        if (state == (121 << 0))
            by = 10
        var bx = 8
        if (state == (121 << 0) || state == (201 << 0))
            bx = 18
        if ((state == (104 << 0) || (isgustavo && ratmount_movespeed >= 10 && key_attack) || sprite_index == spr_player_breakdancesuper || state == (201 << 0) || state == (211 << 0) || state == (5 << 0) || state == (121 << 0) || state == (187 << 0)) && y <= (other.y + by) && xscale == sign(other.image_xscale) && place_meeting(x, (y + s), other) && sprite_index != spr_taunt)
        {
            if (sprite_index != spr_player_ratmountwalljump && sprite_index != spr_trickjump)
            {
                fmod_event_one_shot("event:/sfx/pep/rampjump")
                vsp = -14
                movespeed = 15
                if isgustavo
                {
                    sprite_index = spr_player_ratmountwalljump
                    image_index = 0
                    state = (203 << 0)
                }
                else
                {
                    sprite_index = spr_trickjump
                    image_index = 0
                    state = (187 << 0)
                }
                with (other)
                {
                    if ((!used) && ds_list_find_index(global.saveroom, id) == -1)
                    {
                        other.ramp = 1
                        used = 1
                        ds_list_add(global.saveroom, id)
                    }
                }
                ramp_buffer = 16
                trace("trickjump")
            }
        }
    }
}
