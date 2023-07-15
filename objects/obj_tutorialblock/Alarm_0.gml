scr_sound_multiple("event:/sfx/misc/breakblock", x, y)
repeat (4)
{
    with (create_debris((x + 32), (y + 32), 3552))
        vsp = (-(irandom_range(5, 11)))
}
instance_destroy()
