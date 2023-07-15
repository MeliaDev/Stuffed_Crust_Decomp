switch state
{
    case 1:
        fade = Approach(fade, 1, 0.1)
        fmod_event_one_shot("event:/sfx/intro/pepgustavointro")
        if (fade >= 1)
        {
            state++
            fade = 1.5
            introbuffer = 430
            with (instance_create(0, 0, obj_introprop))
            {
                sprite_index = spr_towerintro
                depth = -6
            }
            with (instance_create(246, 405, obj_introprop))
            {
                sprite_index = spr_towerintro_peppino
                depth = -8
            }
            with (instance_create(136, 416, obj_introprop))
            {
                sprite_index = spr_towerintro_gustavo
                depth = -7
            }
            with (instance_create(623, 72, obj_introprop))
            {
                sprite_index = spr_towerintro_pizzaface
                depth = -7
            }
        }
        break
    case 2:
        fade = Approach(fade, 0, 0.05)
        if (introbuffer > 0)
            introbuffer--
        else if (fade <= 0)
        {
            state++
            introbuffer = 120
        }
        break
    case 3:
        whitefade = Approach(whitefade, 1, 0.1)
        if (introbuffer > 0)
            introbuffer--
        else if (whitefade >= 1)
        {
            with (obj_introprop)
                instance_destroy()
            state++
            if (obj_player1.character == "N" || (obj_player1.character == "P" && obj_player1.ispeppino == 0))
                fmod_event_one_shot("event:/sfx/noise/spin")
            else
                fmod_event_one_shot("event:/sfx/misc/taximove")
        }
        break
    case 4:
        x += movespeed
        if (x >= 358)
        {
            x = 358
            movespeed = 0
        }
        if (boulder_x <= x)
        {
            state++
            vsp = -18
            if (!obj_player.ispeppino)
            {
                sprite_index = spr_playerN_rockethitwall
                with (instance_create(x, y, obj_sausageman_dead))
                {
                    sprite_index = spr_noisetoggle_skatedebris
                    image_index = 0
                    image_alpha = 1
                }
            }
            else
            {
                boulder_index = 1
                sprite_index = spr_player_machfreefall
            }
            fmod_event_one_shot_3d("event:/sfx/misc/breakblock", x, y)
            fmod_event_one_shot_3d("event:/sfx/pep/hurt", x, y)
        }
        break
    case 5:
        x += 16
        y += vsp
        if (vsp < 20)
            vsp += grav
        if (y > ystart)
            y = ystart
        if (x > (room_width + 300))
            state++
        break
    case 6:
        fade = Approach(fade, 1, 0.1)
        if (fade >= 1 && (!instance_exists(obj_fadeout)))
        {
            with (obj_player)
            {
                targetRoom = Titlescreen
                targetDoor = "A"
                state = (18 << 0)
                sprite_index = spr_player_victory
            }
            with (instance_create_unique(0, 0, 979))
                restarttimer = 1
        }
        break
}

if (movespeed == 0)
    boulder_x -= 20
