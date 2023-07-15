if (buffer <= 0 && other.state != (16 << 0))
{
    buffer = 50
    image_alpha = 0
    with (other)
    {
        if (ds_list_find_index(global.saveroom, other.id) == -1)
        {
            notification_push((39 << 0), [room])
            ds_list_add(global.saveroom, other.id)
        }
        fmod_event_one_shot_3d("event:/sfx/pep/gravecorpsestart", x, y)
        vsp = -11
        movespeed = abs(movespeed)
        dir = xscale
        movespeed = 13
        with (instance_create(x, y, obj_jumpdust))
            image_xscale = other.xscale
        sprite_index = spr_player_corpsestart
        image_index = 0
        gravesurfingjumpbuffer = 50
        with (obj_gravecorpse)
        {
            if (playerid == other.id)
                instance_destroy()
        }
        with (instance_create(x, y, obj_gravecorpse))
            playerid = other.id
        state = (211 << 0)
        repeat (5)
        {
            with (create_debris(x, y, 3802, 0))
                vsp = random_range(-8, -11)
        }
        create_transformation_tip(lang_get_value("gravesurftip"), "gravesurf")
    }
}
