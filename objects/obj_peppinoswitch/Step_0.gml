if (global.switchbuffer > 0)
    global.switchbuffer--
if (sprite_index == switchspr2 && instance_exists(obj_charswitch_intro) && obj_charswitch_intro.state != (135 << 0))
{
    if (switchspr2 == 1179)
        image_index = 24
    else
        image_index = 0
}
if (sprite_index == switchspr2 && floor(image_index) == (image_number - 1))
{
    with (obj_player1)
    {
        visible = true
        gustavodash = 0
        ratmount_movespeed = 8
        isgustavo = 0
        if ispeppino
        {
            global.mach_color1 = make_colour_rgb(255, 0, 0)
            global.mach_color2 = make_colour_rgb(0, 255, 0)
        }
        else
        {
            global.mach_color1 = make_colour_rgb(265, 100, 100)
            global.mach_color2 = make_colour_rgb(36, 100, 100)
        }
        state = (0 << 0)
        jumpAnim = 0
        sprite_index = spr_player_idle
        brick = 0
        x = obj_peppinoswitch.x
        y = obj_peppinoswitch.y
        global.switchbuffer = 100
        fmod_event_instance_release(snd_voiceok)
        if ispeppino
            snd_voiceok = fmod_event_create_instance("event:/sfx/voice/ok")
        else
            snd_voiceok = fmod_event_create_instance("event:/sfx/voice/noisepositive")
    }
    sprite_index = spr_gustavosign
}
if (sprite_index == spr_gustavosign && global.panic != escape)
    visible = false
else
    visible = true
if (sprite_index == spr_playerN_idlesmoke && floor(image_index) == (image_number - 1))
    image_index = 25
