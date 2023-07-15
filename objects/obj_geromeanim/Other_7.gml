if (sprite_index == spr_gerome_idle1)
{
    with (obj_geromefollow)
    {
        do_end = 0
        visible = true
    }
    instance_destroy()
}
else
{
    image_speed = 0
    image_index = (image_number - 1)
}
