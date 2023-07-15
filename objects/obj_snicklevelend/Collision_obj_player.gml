if (image_index == 0)
{
    image_speed = 0.35
    image_index = 0
    global.panic = 0
    global.snickchallenge = 0
    if instance_exists(obj_snickexe)
        instance_destroy(obj_snickexe)
}
