function add_music(argument0, argument1, argument2, argument3, argument4) //add_music
{
    if (argument4 == undefined)
        argument4 = -4
    var b = 
    {
        continuous: argument3,
        on_room_start: -4,
        value: 0,
        immediate: 0,
        event: -4,
        event_secret: -4
    }

    with (b)
    {
        if (argument4 != -4)
            on_room_start = method(self, argument4)
        if (argument1 != -4)
        {
            event_name = argument1
            event = fmod_event_create_instance(argument1)
        }
        if (argument2 != -4)
        {
            event_secret_name = argument2
            event_secret = fmod_event_create_instance(argument2)
        }
    }
    ds_map_set(music_map, argument0, b)
    return b;
}

function stop_music() //stop_music
{
    with (obj_music)
    {
        if (music != noone)
        {
            if obj_pause.pause
            {
                fmod_event_instance_stop(music.event, 1)
                fmod_event_instance_stop(music.event_secret, 1)
            }
            else
            {
                fmod_event_instance_stop(music.event, 0)
                fmod_event_instance_stop(music.event_secret, 0)
            }
        }
        fmod_event_instance_stop(pillarmusicID, 1)
        fmod_event_instance_stop(panicmusicID, 1)
    }
}

function hub_state(_room, _sound, argument2) //hub_state
{
    var s = 0
    switch _room
    {
        case tower_1:
        case tower_1up:
        case tower_cheftask1:
        case tower_johngutterhall:
        case tower_ruinsecret:
            s = 0;
            break;
			
        case 752:
        case 778:
        case 815:
        case 810:
            s = 1
            break
			
        case 748:
        case 780:
        case 816:
        case 811:
            s = 2
            break
			
        case 744:
        case 781:
        case 817:
        case 812:
        case 808:
            s = 3
            break
			
        case 740:
        case 818:
        case 807:
        case 813:
            s = 4
            break
    }

    fmod_event_instance_set_parameter(_sound, "hub", s, 0)
}

function musicstates(_room, _sound) //musicstates
{
    fmod_set_parameter("musicmuffle", 0, 0)
    switch _room
    {
        case 24:
        case 25:
        case 26:
        case 27:
        case 28:
        case 30:
        case 32:
        case 33:
        case 35:
        case 36:
        case 37:
        case 38:
        case 758:
            if ((obj_player1.character == "P" && (!obj_player1.ispeppino)) || obj_player1.character == "N")
                fmod_event_instance_set_parameter(_sound, "state", 2, 1)
            else if (global.combo >= 25 && (!global.secret))
                fmod_event_instance_set_parameter(_sound, "state", 1, 1)
            else
                fmod_event_instance_set_parameter(_sound, "state", 0, 1)
            break
        case 822:
        case 776:
        case 659:
        case 39:
        case 40:
        case 41:
        case 44:
        case 719:
        case 800:
        case 731:
        case 138:
        case 145:
        case 194:
        case 196:
        case 441:
        case 454:
        case 672:
        case 673:
        case 560:
        case 565:
            fmod_event_instance_set_parameter(_sound, "state", 0, 1)
            break
        case 729:
        case 734:
        case 149:
        case 772:
        case 457:
        case 674:
            fmod_event_instance_set_parameter(_sound, "state", 1, 1)
            break
        case 46:
        case 773:
            fmod_event_instance_set_parameter(_sound, "state", 2, 1)
            break
        case 787:
            fmod_event_instance_set_parameter(_sound, "state", 5, 0)
            break
        case 554:
            if obj_player1.isgustavo
                fmod_event_instance_set_parameter(_sound, "state", 2, 1)
            break
        case 572:
            if obj_player1.isgustavo
                fmod_event_instance_set_parameter(_sound, "state", 1, 1)
            else
                fmod_event_instance_set_parameter(_sound, "state", 0, 1)
            break
        case 566:
        case 706:
            fmod_set_parameter("musicmuffle", 1, 0)
            break
        case 338:
        case 576:
            fmod_set_parameter("pillarfade", 0, 0)
            break
        default:
            break
    }

}

function secretmusicstates(_room, _sound) //secretmusicstates
{
    switch _room
    {
        case "event:/stuffed/music/level/entrance/entrancesecret":
            if (obj_player1.character == "P")
            {
                fmod_event_instance_set_parameter(_sound, "state", 1, 1)
                if (!obj_player1.ispeppino)
                    fmod_event_instance_set_parameter(_sound, "state", 2, 1)
            }
            else if (obj_player1.character == "N")
                fmod_event_instance_set_parameter(_sound, "state", 2, 1)
            else
                fmod_event_instance_set_parameter(_sound, "state", 0, 1)
            break
        case "event:/stuffed/music/level/forest/forestsecret":
        case "event:/stuffed/music/level/street/streetsecret":
            if obj_player1.isgustavo
                fmod_event_instance_set_parameter(_sound, "state", 1, 1)
            else
                fmod_event_instance_set_parameter(_sound, "state", 0, 1)
            break
        default:
            break
    }

}

function music_get_pos_wrap(argument0, argument1) //music_get_pos_wrap
{
    while (argument0 > argument1)
        argument0 -= argument1
    if (argument0 < 1)
        argument0 = 1
    return argument0;
}

