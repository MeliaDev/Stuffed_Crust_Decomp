if other.thrown
{
    instance_destroy()
    with (obj_pf_fakepep)
    {
        x = other.x
        y = other.y
        create_particle(x, y, (9 << 0))
        state = (138 << 0)
        stunned = 1000
        sprite_index = spr_fakepeppino_vulnerable
        image_index = 0
    }
    instance_destroy(other)
}
