with (obj_player1)
{
    if (global.panic == 1 && global.fill > 0 && (!instance_exists(obj_ghostcollectibles)) && (!global.tutorial_room) && (!instance_exists(obj_doortransition)) && (!instance_exists(obj_doortransition2)) && (!((state == (112 << 0) || state == (297 << 0) || state == (66 << 0) || state == (150 << 0) || state == (292 << 0) || state == (119 << 0) || state == (46 << 0) || state == (98 << 0) || state == (46 << 0) || state == (146 << 0) || state == (95 << 0) || (state == (47 << 0) && (sprite_index == spr_knightpepstart || sprite_index == spr_knightpepthunder)) || instance_exists(obj_fadeout) || instance_exists(obj_doortransition) || instance_exists(obj_doortransition2) || (collision_flags & (1 << 0)) > 0))))
        global.fill -= 0.2
}
if (global.fill <= 0 && global.panic == 1 && (!global.tutorial_room) && pbuff == 0 && (!instance_exists(obj_pizzaface)))
{
    var s = string_letters(room_get_name(room))
    if (string_copy(s, 1, 5) != "tower")
    {
        with (instance_create(obj_player1.x, obj_player1.y, obj_pizzaface))
        {
            sprite_index = spr_pizzaface_laughspawn
            with (instance_create(x, y, obj_objecticontracker))
            {
                objectID = other.id
                sprite_index = spr_icon_pizzaface
                image_speed = 0.18
            }
        }
        fmod_event_one_shot("event:/sfx/pizzaface/laugh")
    }
    else
    {
        with (obj_player)
        {
            instance_destroy(obj_fadeout)
            targetDoor = "A"
            room = timesuproom
            state = (64 << 0)
            sprite_index = spr_Timesup
            image_index = 0
            backtohubroom = 739
            backtohubstartx = 206
            backtohubstarty = 690
            if isgustavo
                sprite_index = spr_player_ratmounttimesup
            visible = true
            image_blend = c_white
            audio_stop_all()
            stop_music()
            fmod_event_one_shot("event:/music/timesup")
        }
    }
}
if (global.fill <= 0)
    global.fill = 0
