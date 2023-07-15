function scr_player_freefallland() //scr_player_freefallland
{
    mach2 = 0
    jumpAnim = 1
    dashAnim = 1
    landAnim = 0
    moveAnim = 1
    stopAnim = 1
    crouchslideAnim = 1
    crouchAnim = 0
    machhitAnim = 0
    movespeed = 0
    facehurt = 1
    start_running = 1
    alarm[4] = 14
    if isgustavo
    {
        if brick
            sprite_index = spr_player_ratmountidle
        else
            sprite_index = spr_lonegustavo_idle
        state = (191 << 0)
    }
    else if (key_jump || key_jump2)
    {
        sprite_index = spr_machfreefall
        if (freefallsmash < 18)
            vsp = -9
        else
            vsp = floor(((-freefallsmash) / 2))
        if key_jump
            vsp -= 3
        state = (92 << 0)
        jumpstop = 1
    }
    else
    {
        vsp = 0
        hsp = 0
        if (floor(image_index) == (image_number - 1))
        {
            sprite_index = spr_facehurtup
            image_index = 0
            state = (0 << 0)
            jumpstop = 1
        }
    }
    image_speed = 0.35
}

