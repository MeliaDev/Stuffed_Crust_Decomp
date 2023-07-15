function scr_player_pummel() //scr_player_pummel
{
    combo = 0
    mach2 = 0
    hsp = (xscale * movespeed)
    start_running = 1
    jumpAnim = 1
    dashAnim = 1
    landAnim = 0
    moveAnim = 1
    stopAnim = 1
    crouchslideAnim = 1
    crouchAnim = 1
    var issprite = (sprite_index == spr_suplexmash1 || sprite_index == spr_suplexmash2 || sprite_index == spr_suplexmash3 || sprite_index == spr_suplexmash4 || sprite_index == spr_suplexmash5 || sprite_index == spr_suplexmash6 || sprite_index == spr_suplexmash7)
    if (sprite_index != spr_grab)
    {
        if (floor(image_index) == (image_number - 1))
        {
            if (!issprite)
            {
                state = (0 << 0)
                image_index = 0
                sprite_index = spr_idle
            }
            else
            {
                sprite_index = spr_grab
                image_index = 0
            }
        }
        image_speed = 0.35
    }
    else
    {
        movespeed = Approach(movespeed, 0, 0.1)
        image_index = 0
        image_speed = 0
    }
}

