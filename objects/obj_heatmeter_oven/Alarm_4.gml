repeat irandom_range(2, 8)
{
    with (instance_create(x, (y - 20), obj_firemouthflame))
        depth = (other.depth - 1)
}
if (irandom(100) >= 75)
    fmod_event_one_shot_3d("event:/sfx/firemouth/dash", x, y)
fmod_event_one_shot_3d("event:/sfx/firemouth/jump", x, y)
if (global.heatmeter && active == 1)
    alarm[4] = irandom_range(35, 80)
