if (fall && hp > 0 && other.state == (42 << 0))
{
    scr_sound_multiple("event:/sfx/misc/breakblock", x, y)
    with (other)
    {
        instance_create((x + (xscale * 25)), y, obj_bangeffect)
        if (frac(other.hp) == 0)
        {
            repeat (4)
                create_debris((other.x + random_range(0, 64)), (other.y + random_range(0, 64)), 1494)
        }
        repeat (3)
        {
            with (instance_create((x + random_range(0, 64)), (y + random_range(0, obj_pizzahead_cog)), obj_parryeffect))
            {
                sprite_index = spr_deadjohnsmoke
                image_speed = 0.35
            }
        }
        scr_pummel()
    }
    with (obj_pepperman)
    {
        if (phase == 2)
            other.hp -= 0.5
        else
            other.hp -= 1
    }
    if (hitLag > 0)
    {
        x = hitX
        y = hitY
    }
    hitX = x
    hitY = y
    hitLag = 10
}
