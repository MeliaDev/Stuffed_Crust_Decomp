with (instance_create(x, y, obj_brickcomeback))
{
    vsp = -4
    sprite_index = spr_ratmountgroundpound_dead
}
with (obj_camera)
{
    shake_mag = 10
    shake_mag_acc = (30 / room_speed)
}
repeat (3)
{
    with (create_debris(x, y, 1531))
    {
        hsp = random_range(-5, 5)
        vsp = random_range(-10, 10)
    }
}
instance_create(x, y, obj_bangeffect)
create_particle(x, (y + 3), (14 << 0), 0)
fmod_event_one_shot_3d("event:/sfx/pep/groundpound", x, y)
