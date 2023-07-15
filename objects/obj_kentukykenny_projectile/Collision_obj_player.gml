with (other)
{
    if (character == "V")
        scr_hurtplayer(object_index)
    else if scr_transformationcheck()
    {
        if (state != (10 << 0) && state != (147 << 0) && hurted == 0)
        {
            fmod_event_one_shot_3d("event:/sfx/firemouth/start", x, y)
            create_transformation_tip(lang_get_value("firemouthtip"), "firemouth")
            global.combotime += 10
            firemouthflames = 0
            is_firing = 0
            hsp = 0
            movespeed = 0
            state = (10 << 0)
            image_index = 0
            sprite_index = spr_firemouthintro
            state = (10 << 0)
            bombpeptimer = 3
            instance_destroy(other)
        }
    }
}
