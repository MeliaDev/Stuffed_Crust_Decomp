function scr_player_animatronic() //scr_player_animatronic
{
    sprite_index = spr_pepanimatronic
    image_speed = 0.35
    move = (key_left + key_right)
    hsp = (move * movespeed)
    if (vsp < 0 && (!key_jump2) && (!jumpstop))
    {
        jumpstop = 1
        vsp /= 10
    }
    if (move != 0)
    {
        xscale = move
        movespeed = 4
    }
    else
        movespeed = 0
    if (animatronic_buffer > 0)
        animatronic_buffer--
    else
    {
        fmod_event_one_shot_3d("event:/sfx/misc/detransfo", x, y)
        with (create_debris(x, y, 3494))
            image_index = 0
        with (create_debris(x, y, 3494))
            image_index = 1
        with (create_debris(x, y, 3494))
            image_index = 2
        state = (0 << 0)
    }
    if (animatronic_collect_buffer > 0)
        animatronic_collect_buffer--
    else
    {
        animatronic_collect_buffer = 30
        if (global.collect > 0)
        {
            GamepadSetVibration(0, 0.4, 0.65)
            global.collect -= 10
            fmod_event_one_shot_3d("event:/sfx/pep/hurt", x, y)
            with (instance_create(121, 60, obj_negativenumber))
                number = "-10"
            repeat (10)
                create_debris(x, y, choose(2089, 2092, 2091, 2090, 2094), 1)
        }
        if (global.collect < 0)
            global.collect = 0
    }
    if (can_jump && vsp > 0 && input_buffer_jump > 0)
    {
        input_buffer_jump = 0
        vsp = -11
        jumpstop = 0
    }
    if (move != 0 && grounded && vsp > 0)
    {
        if (steppybuffer > 0)
            steppybuffer--
        else
        {
            create_particle(x, (y + 43), (1 << 0), 0)
            steppybuffer = 12
            fmod_event_one_shot_3d("event:/sfx/pep/step", x, y)
        }
    }
}

