with (other)
{
    if (key_up2 && grounded && movespeed < 10)
    {
        if (character != "S")
        {
            if (character == "V")
                global.storedcharactersnick = 3
            else if (character == "P")
            {
                if ispeppino
                    global.storedcharactersnick = 1
                else
                {
                    global.storedcharactersnick = 2
                    ispeppino = 1
                }
            }
            character = "S"
        }
        else
        {
            if (global.storedcharactersnick == 3)
            {
                character = "V"
                ispeppino = 0
            }
            else
            {
                if (global.storedcharactersnick == 2)
                    ispeppino = 0
                character = "P"
            }
            global.storedcharactersnick = 0
        }
        scr_characterspr()
        state = (0 << 0)
        movespeed = 0
        sprite_index = spr_idle
    }
}
