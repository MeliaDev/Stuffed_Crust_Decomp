if (other.cutscene == 0 && sprite_index != spr_bigmushroom_bounce && other.state != (186 << 0))
{
    other.jumpstop = 1
    with (other)
    {
        grounded = 0
        if (state == (0 << 0) || state == (92 << 0) || state == (105 << 0) || state == (108 << 0) || state == (80 << 0) || state == (61 << 0) || state == (56 << 0) || state == (41 << 0) || state == (23 << 0))
        {
            sprite_index = spr_machfreefall
            image_index = 0
            state = (92 << 0)
        }
        if (state == (37 << 0))
            state = (104 << 0)
    }
    if (sprite_index != spr_bigmushroom_bounce || image_index > 5)
        fmod_event_one_shot_3d("event:/sfx/misc/mushroombounce", x, y)
    sprite_index = spr_bigmushroom_bounce
    image_index = 0
    other.vsp = -14
    other.jumpstop = 1
    if (other.isgustavo && other.state != (204 << 0))
    {
        if (other.ratmount_movespeed < 12)
        {
            other.sprite_index = spr_player_ratmountmushroombounce
            if (!other.brick)
                other.sprite_index = spr_lonegustavo_jumpstart
        }
        else
        {
            other.sprite_index = spr_player_ratmountdashjump
            if (!other.brick)
                other.sprite_index = spr_lonegustavo_dashjump
        }
        other.jumpAnim = 1
        other.state = (192 << 0)
        other.image_index = 0
    }
}
