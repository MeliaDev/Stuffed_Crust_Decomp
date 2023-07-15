function scr_dotaunt() //scr_dotaunt
{
    if ((key_taunt2 || input_finisher_buffer > 0 || (state == (84 << 0) && key_up && supercharged)) && (!skateboarding))
    {
        input_finisher_buffer = 0
        pistolanim = -4
        flash = 0
        notification_push((54 << 0), [room])
        if (((!key_up) || (!supercharged)) && global.tauntcount < 10 && place_meeting(x, y, obj_exitgate) && (global.panic == 1 || instance_exists(obj_wartimer)) && global.combotime > 0)
        {
            global.tauntcount++
            global.collect += 100
            if (global.lap != 0 || global.fill < 1)
            {
                global.combotime = 60
                with (instance_create((x + 16), y, obj_smallnumber))
                    number = "100"
            }
            else
            {
                with (instance_create((x + 16), y, obj_smallnumber))
                    number = "25"
            }
            create_collect(x, y, 1612, 25)
            scr_sound_multiple("event:/sfx/misc/collect", x, y)
        }
        if (!finisher)
        {
            taunttimer = 20
            if (state != (84 << 0) && sprite_index != spr_supertaunt1 && sprite_index != spr_supertaunt2 && sprite_index != spr_supertaunt3 && sprite_index != spr_supertaunt4 && sprite_index != spr_supertaunt5 && sprite_index != spr_player_ratmountsupertaunt)
            {
                tauntstoredmovespeed = movespeed
                tauntstoredvsp = (vsp + grav)
                tauntstoredsprite = sprite_index
                tauntstoredstate = state
            }
            state = (84 << 0)
            if (supercharged && key_up)
            {
                ini_open_from_string(obj_savesystem.ini_str)
                ini_write_real("Game", "supertaunt", 1)
                obj_savesystem.ini_str = ini_close()
                fmod_event_one_shot_3d("event:/sfx/pep/supertaunt", x, y)
                image_index = 0
                sprite_index = choose(spr_supertaunt1, spr_supertaunt2, spr_supertaunt3, spr_supertaunt4, spr_supertaunt5)
                if isgustavo
                    sprite_index = spr_player_ratmountsupertaunt
            }
            else
            {
                scr_create_parryhitbox()
                fmod_event_one_shot_3d("event:/sfx/pep/taunt", x, y)
                taunttimer = 20
                if (character == "V")
                {
                    sprite_index = spr_playerV_taunt
                    image_index = irandom_range(0, 5)
                }
                if (character == "S")
                {
                    sprite_index = spr_snick_taunt
                    image_index = irandom_range(0, 5)
                }
                if (character == "P")
                {
                    sprite_index = spr_player_taunt
                    image_index = irandom_range(0, 18)
                    if (dir == -1)
                    {
                        if (image_index == 11)
                            image_index = 19
                        if (image_index == 17)
                            image_index = 20
                        if (image_index == 18)
                            image_index = 21
                    }
                }
                if (character == "N" || (!ispeppino))
                {
                    sprite_index = spr_playerN_taunt
                    image_index = irandom_range(0, 15)
                    if (dir == -1)
                    {
                        if (image_index == 15)
                            image_index = 16
                    }
                }
                if isgustavo
                {
                    sprite_index = spr_player_ratmounttaunt
                    image_index = irandom_range(0, 6)
                }
            }
            with (instance_create(x, y, obj_taunteffect))
                player = other.id
        }
    }
}

function scr_create_parryhitbox() //scr_create_parryhitbox
{
    parrytimer = taunt_to_parry_max
    instance_destroy(parry_inst)
    parry_inst = instance_create(x, y, obj_parryhitbox)
    var _playerid = 1
    if (object_index == obj_player2)
        _playerid = 2
    with (parry_inst)
    {
        player_id = _playerid
        image_xscale = other.xscale
    }
}

