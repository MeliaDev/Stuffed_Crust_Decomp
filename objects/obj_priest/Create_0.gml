image_speed = 0.35
mask_index = spr_priest_idle
collect = 1
escape = 0
depth = 1
angel = 0
var theroomname = room_get_name(room)
if (string_pos("graveyard", theroomname) != 0 || sprite_index == spr_angelpriest)
{
    sprite_index = choose(spr_angelpriest, spr_angelpriest2)
    if (sprite_index == spr_angelpriest2)
    {
        if (image_xscale == 1)
            image_xscale = -1
        else if (image_xscale == -1)
            image_xscale = 1
    }
    angel = 1
}
