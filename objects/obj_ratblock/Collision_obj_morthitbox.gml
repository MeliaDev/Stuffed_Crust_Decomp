if (sprite_index != spr_rattumbleblock && sprite_index != spr_rattumbleblock_big)
{
    fmod_event_one_shot_3d("event:/sfx/mort/mortslap", x, y)
    instance_destroy()
}
else if (sprite_index != spr_rattumbleblock_bump && sprite_index != spr_rattumbleblock_big_bump)
{
    if (sprite_index == spr_rattumbleblock)
        sprite_index = spr_rattumbleblock_bump
    if (sprite_index == spr_rattumbleblock_big)
        sprite_index = spr_rattumbleblock_big_bump
    image_index = 0
    fmod_event_one_shot_3d("event:/sfx/pep/bumpwall", x, y)
}
