if (thumbingup == 0 && state != (55 << 0))
{
    fmod_event_one_shot_3d("event:/sfx/mort/hook", x, y)
    image_xscale = (-obj_player.xscale)
    thumbingup = 1
    instance_create(x, y, obj_bangeffect)
    sprite_index = spr_grabbiehand_hifive
    image_index = 0
}
