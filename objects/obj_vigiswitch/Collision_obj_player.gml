with (other)
{
    if (key_up2 && grounded && movespeed < 10)
    {
        if (character != "V")
        {
            if (character == "S")
                global.storedcharactervigi = 3
            else if (character == "P")
            {
                if ispeppino
                    global.storedcharactervigi = 1
                else
                {
                    global.storedcharactervigi = 2
                    ispeppino = 1
                }
            }
            character = "V"
        }
        else
        {
            if (global.storedcharactervigi == 3)
            {
                character = "S"
                ispeppino = 0
            }
            else
            {
                if (global.storedcharactervigi == 2)
                    ispeppino = 0
                character = "P"
            }
            global.storedcharactervigi = 0
        }
        scr_characterspr()
        state = (0 << 0)
        movespeed = 0
        sprite_index = spr_idle
    }
}
