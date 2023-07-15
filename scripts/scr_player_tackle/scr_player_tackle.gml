function scr_player_tackle() //scr_player_tackle
{
    combo = 0
    mach2 = 0
    hsp = ((-xscale) * movespeed)
    start_running = 1
    jumpAnim = 1
    dashAnim = 1
    landAnim = 0
    moveAnim = 1
    stopAnim = 1
    crouchslideAnim = 1
    crouchAnim = 1
    if (!ispeppino)
    {
        if (sprite_index == spr_player_lungehit || sprite_index == spr_player_kungfu1 || sprite_index == spr_player_kungfu2 || sprite_index == spr_player_kungfu3)
            sprite_index = choose(spr_playerN_finishingblow1, spr_playerN_finishingblow2, spr_playerN_finishingblow3, spr_playerN_finishingblow4, spr_playerN_finishingblow5, spr_playerN_parry1)
    }
    if (sprite_index != spr_player_lungehit && sprite_index != spr_player_kungfu1 && sprite_index != spr_player_kungfu2 && sprite_index != spr_player_kungfu3 && sprite_index != spr_playerN_finishingblow1 && sprite_index != spr_playerN_finishingblow2 && sprite_index != spr_playerN_finishingblow3 && sprite_index != spr_playerN_finishingblow4 && sprite_index != spr_playerN_finishingblow5 && sprite_index != spr_playerN_parry1)
    {
        if (sprite_index != spr_golfswing)
        {
            if (grounded && vsp > 0.5)
                state = (0 << 0)
        }
        else if (floor(image_index) == (image_number - 1) && grounded)
            state = (0 << 0)
    }
    else
    {
        invtime = 30
        movespeed = Approach(movespeed, 0, 0.1)
        if (floor(image_index) == (image_number - 1) && grounded && vsp > 0)
            state = (0 << 0)
    }
    if (floor(image_index) != (image_number - 1))
        image_speed = 0.35
    else
        image_speed = 0
}

