function scr_player_Sjumpprep() //scr_player_Sjumpprep
{
    switch character
    {
        case "S":
        case "V":
        case "P":
            if (sprite_index == spr_superjumppreplight || sprite_index == spr_superjumpright || sprite_index == spr_superjumpleft)
                move = (key_left + key_right)
            else
                move = xscale
            if (!(place_meeting(x, (y + 1), obj_railparent)))
                hsp = (move * movespeed)
            else
            {
                var _railinst = instance_place(x, (y + 1), obj_railparent)
                hsp = ((move * movespeed) + (_railinst.movespeed * _railinst.dir))
            }
            if (sprite_index == spr_superjumpprep || (character == "S" && move == 0))
                movespeed = Approach(movespeed, 0, 0.8)
            if (floor(image_index) == (image_number - 1) && sprite_index == spr_superjumpprep)
                sprite_index = spr_superjumppreplight
            if (sprite_index == spr_superjumppreplight || (character == "S" && move != 0))
                movespeed = 2
            if (sprite_index != spr_superjumpprep)
            {
                if (move != 0 && (sprite_index == spr_superjumppreplight || sprite_index == spr_superjumpright || sprite_index == spr_superjumpleft))
                {
                    if (xscale == 1)
                    {
                        if key_right
                            sprite_index = spr_superjumpright
                        if (-key_left)
                            sprite_index = spr_superjumpleft
                    }
                    if (xscale == -1)
                    {
                        if key_right
                            sprite_index = spr_superjumpleft
                        if (-key_left)
                            sprite_index = spr_superjumpright
                    }
                }
                else
                    sprite_index = spr_superjumppreplight
            }
            if ((!scr_check_superjump()) && (!(scr_solid(x, (y - 16)))) && (!(scr_solid(x, (y - 32)))))
            {
                instance_create(x, y, obj_explosioneffect)
                sprite_index = spr_superjump
                state = (97 << 0)
                if (character == "V")
                    vsp = -24
                else
                    vsp = -17
                image_index = 0
            }
            image_speed = 0.35
            break
        case "N":
            hsp = 0
            vsp = 0
            pogocharge = 50
            if (floor(image_index) == (image_number - 1))
            {
                if (sprite_index == spr_playerN_jetpackstart)
                {
                    if (key_up || key_down)
                    {
                        sprite_index = ((!key_up) ? spr_playerN_jetpackboostdown : spr_superjump)
                        state = (97 << 0)
                        vsp = -17
                        image_index = 0
                    }
                    else
                    {
                        state = (121 << 0)
                        sprite_index = spr_superjumpcancel
                        instance_create(x, y, obj_jumpdust)
                        movespeed = 15
                    }
                }
                else if (sprite_index == spr_superjumpprep)
                {
                    fmod_event_instance_set_parameter(superjumpsnd, "state", 2, 1)
                    instance_create(x, y, obj_explosioneffect)
                    sprite_index = spr_superjump
                    state = (97 << 0)
                    vsp = -17
                }
            }
            if (sprite_index == spr_playerN_jetpackstart)
                image_speed = 0.5
            else
                image_speed = 0.3
            break
    }

}

