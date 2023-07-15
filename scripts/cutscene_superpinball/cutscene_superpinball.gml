function cutscene_superpinball_start() //cutscene_superpinball_start
{
    var _finish = 0
    with (obj_player1)
    {
        if (state != (112 << 0) && state != (95 << 0))
            _finish = 1
    }
    if _finish
    {
        with (obj_player)
        {
            if check_player_coop()
            {
                state = (146 << 0)
                sprite_index = spr_idle
            }
        }
        cutscene_end_action()
    }
}

function cutscene_superpinball_middle() //cutscene_superpinball_middle
{
    var t = noone
    with (obj_superpinballmachine)
    {
        x -= other.movespeed
        t = id
    }
    movespeed += 0.25
    with (obj_player)
    {
        if check_player_coop()
        {
            x = (t.x + (t.sprite_width / 2))
            y = (t.bbox_top - 46)
        }
    }
    if (t.x < 96)
        cutscene_end_action()
}

function cutscene_superpinball_middle2() //cutscene_superpinball_middle2
{
    with (obj_player)
    {
        if (vsp >= 0 && check_player_coop())
        {
            vsp = -12
            hsp = -10
        }
    }
    if (obj_player1.x < 0)
        cutscene_end_action()
}

function cutscene_superpinball_middle3() //cutscene_superpinball_middle3
{
    with (obj_player)
    {
        if check_player_coop()
        {
            vsp = -12
            hsp = -10
        }
    }
    cutscene_end_action()
}

function cutscene_superpinball_middle4() //cutscene_superpinball_middle4
{
    if (obj_player1.y > 540)
        cutscene_end_action()
}

function cutscene_superpinball_middle5() //cutscene_superpinball_middle5
{
    with (obj_player)
    {
        if check_player_coop()
        {
            vsp = 20
            hsp = 0
        }
    }
    cutscene_end_action()
}

function cutscene_superpinball_end() //cutscene_superpinball_end
{
    with (obj_player)
    {
        if check_player_coop()
            state = (0 << 0)
    }
    global.pubcutscene = 1
    quick_ini_write_real(get_savefile_ini(), "cutscene", "pub", 1)
    cutscene_end_action()
}

function check_player_coop() //check_player_coop
{
    return (object_index != obj_player2 || global.coop);
}

