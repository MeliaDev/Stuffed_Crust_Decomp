if (other.state == (42 << 0) && other.grounded)
{
    with (other)
    {
        state = (293 << 0)
        sprite_index = spr_player_pistolintro
        image_index = 0
        image_speed = 0.35
        tauntstoredstate = (0 << 0)
        fmod_event_one_shot("event:/sfx/pep/pistolstart")
        fmod_event_one_shot_3d("event:/sfx/misc/breakblock", x, y)
    }
    if (room == boss_pizzaface)
    {
        with (obj_music)
        {
            if (music != noone)
                fmod_event_instance_set_parameter(music.event, "state", 1.4, 1)
        }
    }
    global.pistol = 1
    instance_destroy()
}
