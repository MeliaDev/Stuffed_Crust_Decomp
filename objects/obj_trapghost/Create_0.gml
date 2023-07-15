if (instance_number(object_index) > 1)
{
    instance_destroy(id, false)
    return;
}
alarm[0] = 1
depth = -7
image_alpha = 0
target_alpha = 0.6
alpha = 0
state = (0 << 0)
trapid = -4
image_speed = 0.35
snd_loop = fmod_event_create_instance("event:/sfx/kingghost/loop")
snd_move = fmod_event_create_instance("event:/sfx/kingghost/move")
