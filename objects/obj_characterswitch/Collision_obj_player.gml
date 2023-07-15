if other.key_up2
{
    if (sprite_index != spr_noisetoggle_pedestal_empty)
    {
        with (other)
        {
            if (character == "P")
            {
                character = "N"
                create_transformation_tip(lang_get_value("noisepogo"))
                with (instance_create(x, y, obj_sausageman_dead))
                {
                    sprite_index = spr_noisetoggle_skatedebris
                    image_index = 0
                    image_alpha = 1
                }
            }
            else
            {
                character = "P"
                create_transformation_tip(lang_get_value("noiseskate"))
                with (instance_create(x, y, obj_sausageman_dead))
                {
                    sprite_index = spr_noisetoggle_pogodebris
                    image_index = 0
                    image_alpha = 1
                }
            }
            scr_characterspr()
            other.sprite_index = spr_noisetoggle_pedestal_empty
        }
        fmod_event_one_shot_3d("event:/sfx/voice/noisepositive", x, y)
        alarm[4] = 120
    }
    else if other.ispeppino
        create_transformation_tip(lang_get_value("noisetoggle_infotip"))
}
