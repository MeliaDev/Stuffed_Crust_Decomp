if (sprite_index == spr_gustavoswitch2 && instance_exists(obj_charswitch_intro) && obj_charswitch_intro.state != (135 << 0))
    image_index = 0
if (sprite_index == spr_gustavoswitch2 && floor(image_index) == (image_number - 1))
{
    with (obj_player1)
    {
        visible = true
        create_particle(x, y, (9 << 0))
        ratmount_movespeed = 8
        gustavodash = 0
        isgustavo = 1
        state = (191 << 0)
        jumpAnim = 0
        sprite_index = spr_player_ratmountidle
        brick = 1
        x = obj_gustavoswitch.x
        y = obj_gustavoswitch.y
        global.switchbuffer = 100
        fmod_event_instance_release(snd_voiceok)
        snd_voiceok = fmod_event_create_instance("event:/sfx/voice/gusok")
        if (room == street_jail)
        {
            with (obj_music)
            {
                if (music != noone)
                    fmod_event_instance_set_parameter(music.event, "state", 1, 1)
            }
        }
        else if (room == forest_G1)
        {
            with (obj_music)
            {
                if (music != noone)
                    fmod_event_instance_set_parameter(music.event, "state", 2, 1)
            }
        }
    }
    sprite_index = spr_pepsign
}
if (sprite_index == spr_pepsign && global.panic != escape)
    visible = false
else
    visible = true
