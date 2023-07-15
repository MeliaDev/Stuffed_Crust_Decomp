if collision
{
    scr_collide()
    if (grounded && vsp > 0)
    {
        with (instance_create(x, y, content))
        {
            important = 1
            image_xscale = other.image_xscale
            state = (138 << 0)
            sprite_index = other.sprite_index
            stunned = 2
            if (other.content == obj_ninja)
                paletteselect = other.paletteselect
        }
        instance_destroy()
    }
}
else
{
    x += hsp
    y += vsp
    if (vsp < 20)
        vsp += grav
    if (vsp > 0)
        collision = 1
}
