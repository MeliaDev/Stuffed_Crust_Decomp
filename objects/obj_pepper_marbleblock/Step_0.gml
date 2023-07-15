mask_index = spr_pepperman_statues1
if (hitLag <= 0)
    scr_collide()
else
{
    x = (hitX + irandom_range(-4, 4))
    y = (hitY + irandom_range(-4, 4))
    hitLag--
    if (hitLag <= 0)
    {
        x = hitX
        y = hitY
    }
}
if ((!fall) && grounded && vsp > 0)
{
    fmod_event_one_shot_3d("event:/sfx/pep/groundpound", x, y)
    fall = 1
    grabID = instance_create((x + (32 * image_xscale)), y, obj_grabmarker)
    with (grabID)
        ID = other.id
    with (obj_camera)
    {
        shake_mag = 3
        shake_mag_acc = (5 / room_speed)
    }
}
if contemplated
{
    with (obj_pepperman)
    {
        if (thrown || state == (273 << 0))
            instance_destroy(other)
        else if (state != (267 << 0) && state != (137 << 0) && state != (138 << 0))
        {
            other.contemplated = 0
            marbleblockID = -4
        }
    }
}
image_index = round((maxhp - hp))
if (floor(image_index) == (image_number - 1))
    instance_destroy(grabID)
