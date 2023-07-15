if (started > 0)
{
    with (obj_player1)
    {
        movespeed = 0
        hsp = 0
        vsp = 0
        if (sprite_index == spr_lookdoor)
        {
            if (x > (other.x + 2))
                x -= 2
            else if (x < (other.x - 2))
                x += 2
            else
                x = other.x
            if (floor(image_index) == (image_number - 1))
            {
                image_alpha = 0
                image_index = (image_number - 1)
                image_speed = 0
                if (x == other.x)
                {
                    with (other)
                    {
                        image_index = 0
                        dodraw = 1
                    }
                }
            }
            else if (other.dodraw == 0)
                image_speed = 0.35
        }
        if (other.started == 2)
        {
            if (other.choosed == 1)
            {
                if (other.char == 0)
                {
                    character = "P"
                    ispeppino = 1
                }
                if (other.char == 1)
                {
                    character = "P"
                    ispeppino = 0
                }
                if (other.char == 2)
                {
                    character = "V"
                    ispeppino = 1
                }
                if (other.char == 3)
                {
                    character = "S"
                    ispeppino = 1
                }
                machreset = 1
                scr_characterspr()
                other.choosed = 0
            }
            with (other)
            {
                image_index = 1
                dodraw = 0
                started = 3
            }
            sprite_index = spr_walkfront
            image_speed = 0.35
        }
        if (other.started == 3)
        {
            if (sprite_index == spr_walkfront)
            {
                if (floor(image_index) == (image_number - 1))
                {
                    image_alpha = 1
                    image_index = 0
                    state = (0 << 0)
                    with (other)
                    {
                        image_index = 0
                        started = 0
                    }
                }
                else
                    image_speed = 0.35
            }
        }
    }
}
if global.panic
{
    if (uparrowID != noone)
    {
        instance_destroy(uparrowID)
        uparrowID = -4
    }
}
