if (playerid.visible == false)
{
    global.hp = 8
    global.failcutscene = 0
    with (obj_player1)
    {
        fmod_event_one_shot("event:/sfx/misc/taxibeep")
        state = (0 << 0)
        instance_create(x, y, obj_genericpoofeffect)
        cutscene = 0
        if isgustavo
        {
            state = (191 << 0)
            sprite_index = spr_player_ratmountidle
        }
    }
    if (global.coop == 1)
    {
        with (obj_player2)
        {
            state = (0 << 0)
            cutscene = 0
            if isgustavo
                state = (191 << 0)
        }
    }
    obj_player1.visible = true
    obj_player2.visible = true
}
