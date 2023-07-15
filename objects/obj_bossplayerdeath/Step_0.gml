fade = Approach(fade, 1, 0.03)
if fade2start
    fade2 = Approach(fade2, 1, 0.06)
with (obj_player1)
{
    image_speed = 0.35
    switch other.state
    {
        case (92 << 0):
            if (sprite_index == spr_player_outofpizza1 && floor(image_index) == (image_number - 1))
                sprite_index = spr_player_outofpizza2
            if (sprite_index == spr_slipbanan1 && floor(image_index) == (image_number - 1))
                image_index = (image_number - 1)
            hsp = (deathspeed * (-xscale))
            if place_meeting((x + sign(hsp)), y, obj_solid)
            {
                fmod_event_one_shot_3d("event:/sfx/pep/groundpound", x, y)
                xscale *= -1
                instance_create((x + (xscale * 20)), y, obj_bangeffect)
            }
            if (grounded && vsp > 0)
            {
                image_index = 0
                if (character == "P" && ispeppino)
                    sprite_index = spr_player_outofpizza3
                else
                    sprite_index = spr_slipbanan2
                other.state = (0 << 0)
                other.alarm[0] = 200
                other.alarm[2] = 150
            }
            break
        case (0 << 0):
            if (sprite_index == spr_player_outofpizza3 && floor(image_index) == (image_number - 1))
                sprite_index = spr_player_outofpizza4
            if (sprite_index == spr_slipbanan2 && floor(image_index) == (image_number - 1))
                image_index = (image_number - 1)
            hsp = (deathspeed * (-xscale))
            deathspeed = Approach(deathspeed, 0, 0.5)
            break
    }

}
