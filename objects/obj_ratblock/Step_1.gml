with (obj_player)
{
    if ((state == (42 << 0) || state == (121 << 0) || state == (104 << 0) || (state == (5 << 0) && sprite_index == spr_crouchslip)) && (place_meeting((x + sign(hsp)), y, other) || place_meeting((x + xscale), y, other)))
    {
        state = (106 << 0)
        hsp = ((-xscale) * 5)
        vsp = -2
        if (!isgustavo)
            sprite_index = spr_bump
        else if brick
            sprite_index = spr_player_ratmountbump
        else
            sprite_index = spr_lonegustavo_bump
        fmod_event_one_shot_3d("event:/sfx/pep/bumpwall", x, y)
        with (other)
        {
            image_index = 0
            switch sprite_index
            {
                case spr_ratblock:
                    sprite_index = spr_ratblock_bump
                    break
                case 3898:
                    sprite_index = spr_ratblock1_bump
                    break
                case 184:
                    sprite_index = spr_ratblock2_bump
                    break
                case 2645:
                    sprite_index = spr_ratblock3_bump
                    break
                case 3000:
                    sprite_index = spr_ratblock4_bump
                    break
                case 2622:
                    sprite_index = spr_ratblock5_bump
                    break
                case 3697:
                    sprite_index = spr_ratblock6_bump
                    break
                case 2867:
                    sprite_index = spr_rattumbleblock_bump
                    break
                case 1158:
                    sprite_index = spr_rattumbleblock_big_bump
                    break
            }

        }
    }
}
