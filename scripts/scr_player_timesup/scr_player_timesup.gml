function scr_player_timesup() //scr_player_timesup
{
    xscale = 1
    inv_frames = 0
    movespeed = 0
    if (sprite_index != spr_player_ratmounttimesup)
        sprite_index = spr_Timesup
    alarm[7] = -1
    alarm[8] = -1
    alarm[5] = -1
    if place_meeting(x, y, obj_timesup)
    {
        state = (89 << 0)
        if (sprite_index != spr_player_ratmounttimesup)
            sprite_index = spr_deathstart
        else
        {
            sprite_index = spr_player_ratmountgameover
            with (create_debris(x, y, 3949))
            {
                hsp = irandom_range(-4, 4)
                vsp = -8
            }
        }
    }
    if (room == timesuproom)
    {
        obj_player1.x = 480
        obj_player1.y = 270
        obj_player2.x = -100
        obj_player2.y = -100
    }
    if (floor(image_index) == 9)
        image_speed = 0
}

