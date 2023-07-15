if (sprite_index == spr_gnomepizza_dead)
{
    image_speed = 0
    image_index = (image_number - 1)
    with (obj_gnomehouse1)
        image_index = 0
    with (obj_gnomehouse2)
        image_index = 0
    with (obj_gnomehouse3)
        image_index = 0
    with (obj_gnomehouse4)
        image_index = 0
    with (obj_gnomehouse5)
        image_index = 0
    with (obj_customeractor)
        instance_destroy()
}
