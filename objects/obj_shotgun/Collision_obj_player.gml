with (other)
{
    if (state == (42 << 0) || state == (43 << 0) || state == (80 << 0))
    {
        image_index = 0
        sprite_index = spr_shotgunpullout
        fmod_event_one_shot_3d("event:/sfx/pep/shotgunload", x, y)
        fmod_event_one_shot_3d("event:/sfx/misc/breakblock", x, y)
        instance_destroy(other)
        shotgunAnim = 1
        state = (66 << 0)
        create_transformation_tip(lang_get_value("shotguntip"), "shotgun")
        if (room == war_1)
        {
            with (instance_create_unique(0, 0, 422))
            {
                minutes = 0
                seconds = 40
            }
            with (obj_escapecollect)
                image_alpha = 1
            with (obj_music)
                fmod_event_instance_play(music.event)
        }
        with (instance_create(x, y, obj_shotgunback))
        {
            x = (obj_player1.x - (20 * obj_player1.xscale))
            y = obj_player1.y
            image_xscale = obj_player1.xscale
            depth = (obj_player1.depth + 1)
            visible = false
        }
        global.heattime = 60
    }
}
