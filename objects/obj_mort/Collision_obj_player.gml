if (sprite_index != spr_mortspawn)
{
    with (other)
    {
        if (state != (11 << 0) && state != (12 << 0) && state != (13 << 0) && state != (14 << 0) && state != (190 << 0))
        {
            repeat (6)
                create_debris(x, y, 1541)
            mort = 1
            instance_create_unique(x, y, 21)
            movespeed = hsp
            state = (11 << 0)
            fmod_event_one_shot_3d("event:/sfx/mort/mortpickup", x, y)
            create_transformation_tip(lang_get_value("morttip"), "morttip")
            instance_destroy(other)
        }
    }
}
