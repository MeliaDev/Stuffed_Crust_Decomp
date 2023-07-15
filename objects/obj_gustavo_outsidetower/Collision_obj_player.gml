if (other.key_up2 && interactbuffer == 0)
{
    fmod_event_one_shot_3d("event:/sfx/voice/gusok", x, y)
    sprite_index = spr_gustavo_point
    image_xscale = (other.xscale * -1)
    y += 2
    alarm[4] = 100
    interactbuffer = 1
}
