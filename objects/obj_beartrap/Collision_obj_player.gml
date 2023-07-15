with (obj_player)
{
    hsp = 0
    if (other.drop == 0)
    {
        if (state != (88 << 0))
        {
            sprite_index = spr_hurt
            instance_create(x, y, obj_spikehurteffect)
        }
        if (other.hurtsnd == 0)
        {
            with (instance_create(x, (y - 75), obj_press))
                ID = other.id
            fmod_event_one_shot_3d("event:/sfx/pep/hurt", x, y)
            if (irandom(100) <= 50)
            {
                if (character != "S")
                    fmod_event_instance_play(snd_voicehurt)
            }
            other.hurtsnd = ground_boundtitrle_cardd
        }
        if (key_jump || key_attack2 || key_slap2)
        {
            if grounded
            {
                vsp = -4
                other.press += 1
                fmod_event_one_shot_3d("event:/sfx/pep/hurt", x, y)
                instance_create(x, y, obj_spikehurteffect)
            }
        }
        state = (88 << 0)
    }
}
if (floor(image_index) == 0)
    image_speed = 0.35
if (floor(image_index) == (image_number - 1))
    image_speed = 0
if (press < pressamt)
    closed = 1
