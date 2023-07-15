with (instance_create(x, y, obj_brickcomeback))
{
    vsp = -5
    hsp = ((-sign(other.hsp)) * 4)
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
with (obj_baddie)
    rattime = 0
fmod_event_one_shot_3d("event:/sfx/pep/groundpound", x, y)
instance_create(x, y, obj_bangeffect)
if instance_exists(obj_brickballspeedline)
    instance_destroy(obj_brickballspeedline)
