if (floor(image_index) == (image_number - 1))
    image_speed = 0
if (global.collect >= global.collectN)
{
    if (obj_player1.character == "P" && obj_player1.ispeppino)
    {
        if (global.rank == "s")
            sprite_index = spr_rankS
        if (global.rank == "a")
            sprite_index = spr_rankA
        if (global.rank == "b")
            sprite_index = spr_rankB
        if (global.rank == "c")
            sprite_index = spr_rankC
        if (global.rank == "d")
            sprite_index = spr_rankD
        if (global.rank == "p")
            sprite_index = spr_rankP
    }
    else
    {
        if (global.rank == "s")
            sprite_index = spr_rankNS
        if (global.rank == "a")
            sprite_index = spr_rankNA
        if (global.rank == "b")
            sprite_index = spr_rankNB
        if (global.rank == "c")
            sprite_index = spr_rankNC
        if (global.rank == "d")
            sprite_index = spr_rankND
        if (global.rank == "p")
            sprite_index = spr_rankNP
    }
}
if (global.collectN > global.collect)
{
    if (obj_player2.character == "P" && obj_player1.ispeppino)
    {
        if (global.rank == "s")
            sprite_index = spr_rankS
        if (global.rank == "a")
            sprite_index = spr_rankA
        if (global.rank == "b")
            sprite_index = spr_rankB
        if (global.rank == "c")
            sprite_index = spr_rankC
        if (global.rank == "d")
            sprite_index = spr_rankD
        if (global.rank == "p")
            sprite_index = spr_rankP
    }
    else
    {
        if (global.rank == "s")
            sprite_index = spr_rankNS
        if (global.rank == "a")
            sprite_index = spr_rankNA
        if (global.rank == "b")
            sprite_index = spr_rankNB
        if (global.rank == "c")
            sprite_index = spr_rankNC
        if (global.rank == "d")
            sprite_index = spr_rankND
        if (global.rank == "p")
            sprite_index = spr_rankNP
    }
}
if brown
{
    brownfade = Approach(brownfade, 1, 0.07)
    switch toppin_state
    {
        case (92 << 0):
            if (brownfade < 1)
                break
            else
            {
                var spd = 20
                var yy = (obj_screensizer.actual_height - 62)
                toppin_y[toppin_index] -= spd
                toppin_yscale[toppin_index] = 1.2
                if (toppin_y[toppin_index] <= yy)
                {
                    if (toppin[toppin_index] == 1)
                    {
                        createmoney[toppin_index] = 1
                        if toppinvisible
                            fmod_event_one_shot_3d("event:/sfx/misc/kashing", (room_width / 2), (room_height / 2))
                    }
                    if toppinvisible
                        fmod_event_one_shot_3d("event:/sfx/misc/toppingot", (room_width / 2), (room_height / 2))
                    toppin_y[toppin_index] = yy
                    toppin_state = (8 << 0)
                    brown = 1
                }
                break
            }
        case (8 << 0):
            toppin_yscale[toppin_index] = Approach(toppin_yscale[toppin_index], 1, 0.1)
            if (toppin_yscale[toppin_index] == 1)
            {
                toppin_index++
                if (toppin_index >= array_length(toppin))
                {
                    toppin_state = (0 << 0)
                    alarm[3] = 40
                }
                else
                    toppin_state = (92 << 0)
            }
            break
    }

}
if instance_exists(obj_treasureviewer)
    visible = false
