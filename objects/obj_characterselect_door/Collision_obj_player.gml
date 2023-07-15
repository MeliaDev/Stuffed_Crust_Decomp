if (other.key_up && other.grounded && started == 0 && (!global.panic))
{
    started = 1
    image_index = 1
    with (other)
    {
        if (character == "P")
        {
            if ispeppino
                other.char = 0
            else
                other.char = 1
        }
        if (character == "N")
            other.char = 1
        if (character == "V")
            other.char = 2
        if (character == "S")
            other.char = 3
        sprite_index = spr_lookdoor
        image_index = 0
        image_speed = 0.35
        state = (146 << 0)
    }
}
