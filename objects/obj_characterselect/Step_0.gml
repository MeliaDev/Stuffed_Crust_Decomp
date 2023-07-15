image_speed = 0.35
move2 = ((-obj_player1.key_left2) + obj_player1.key_right2)
if (ready == 0)
{
    if move2
        selected ^= 1
}
else if instance_exists(obj_musicOLD)
{
    with (obj_musicOLD)
        instance_destroy()
}
if (obj_player1.key_jump && selected == 0 && obj_peppinoselect.sprite_index != spr_peppinoselected)
{
    ready = 1
    obj_peppinoselect.sprite_index = spr_peppinoselected
    obj_peppinoselect.image_index = 0
    with (obj_player1)
    {
        fmod_event_one_shot("event:/sfx/voice/myea")
        character = "P"
        ispeppino = 1
        scr_characterspr()
    }
    with (obj_player2)
    {
        if (global.coop == 1)
        {
            character = "P"
            ispeppino = 0
            scr_characterspr()
            fmod_event_one_shot("event:/sfx/noise/woag")
            obj_noiseselect.sprite_index = spr_noiseselected
            obj_noiseselect.image_index = 0
        }
    }
    with (obj_music)
        fmod_set_parameter("pillarfade", 1, 0)
    alarm[0] = 100
}
if (obj_player1.key_jump && selected == 1 && obj_noiseselect.sprite_index != spr_noiseselected)
{
    ready = 1
    obj_noiseselect.sprite_index = spr_noiseselected
    obj_noiseselect.image_index = 0
    with (obj_player1)
    {
        fmod_event_one_shot("event:/sfx/voice/noisepositive")
        character = "P"
        ispeppino = 0
        scr_characterspr()
    }
    with (obj_player2)
    {
        if (global.coop == 1)
        {
            character = "P"
            ispeppino = 1
            scr_characterspr()
            fmod_event_one_shot("event:/sfx/voice/myea")
            obj_peppinoselect.sprite_index = spr_peppinoselected
            obj_peppinoselect.image_index = 0
        }
    }
    with (obj_music)
        fmod_set_parameter("pillarfade", 1, 0)
    alarm[0] = 100
}
