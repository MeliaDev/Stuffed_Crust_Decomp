with (obj_player1)
{
    if ((place_meeting((x + (movespeed * xscale)), y, other) || place_meeting((x + xscale), y, other)) && (obj_player1.state == (121 << 0) || (obj_player1.ghostdash == 1 && obj_player1.ghostpepper >= 3) || obj_player1.ratmount_movespeed >= 12 || (obj_player.state == (20 << 0) && obj_player1.movespeed >= 12) || obj_player1.state == (184 << 0) || obj_player1.state == (38 << 0) || obj_player1.state == (153 << 0)))
    {
        if (character != "V" || mach4mode || dynamitehold)
        {
            playerindex = 0
            if (dynamitehold == 1)
            {
                instance_create(x, y, obj_dynamiteexplosion)
                dynamitehold = 0
                dynamitereal = 0
            }
            instance_destroy(other)
        }
        else
        {
            if (!isgustavo)
                sprite_index = spr_hitwall
            else if brick
                sprite_index = spr_player_ratmountbump
            else
                sprite_index = spr_lonegustavo_bump
            fmod_event_one_shot_3d("event:/sfx/pep/groundpound", x, y)
            fmod_event_one_shot_3d("event:/sfx/pep/bumpwall", x, y)
            hsp = 0
            flash = 0
            state = (106 << 0)
            hsp = (-6 * xscale)
            vsp = -6
            mach2 = 0
            image_index = 0
            instance_create((x + 10), (y + 10), obj_bumpeffect)
        }
    }
}
if global.panic
    sprite_index = spr_metalbescape
if (place_meeting(x, (y + 1), obj_player1) || place_meeting(x, (y - 1), obj_player1) || place_meeting((x - 1), y, obj_player1) || place_meeting((x + 1), y, obj_player1))
{
    if (obj_player1.ghostdash == 1 && obj_player1.ghostpepper >= 3)
        instance_destroy()
    if (place_meeting(x, (y - 1), obj_player1) && (obj_player1.state == (108 << 0) || obj_player1.state == (76 << 0)) && obj_player1.freefallsmash >= 10)
    {
        with (instance_place(x, (y - 1), obj_player1))
        {
            if (character == "M")
            {
                state = (92 << 0)
                vsp = -7
                sprite_index = spr_jump
            }
        }
        playerindex = 0
        instance_destroy()
    }
    if (obj_player1.state == (41 << 0) && obj_player1.movespeed >= 13 && obj_player1.sprite_index != spr_player_chainsawcrouch)
        instance_destroy()
    if (place_meeting(x, (y - 1), obj_player1) && ((obj_player1.state == (198 << 0) && obj_player1.vsp > 0) || obj_player1.state == (47 << 0) || obj_player1.state == (19 << 0)))
    {
        playerindex = 0
        instance_destroy()
    }
}
with (obj_player2)
{
    if ((place_meeting((x + hsp), y, other) || place_meeting((x + xscale), y, other)) && (obj_player2.state == (121 << 0) || obj_player2.state == (38 << 0) || obj_player2.state == (153 << 0)))
    {
        playerindex = 1
        instance_destroy(other)
    }
}
if (place_meeting(x, (y + 1), obj_player2) || place_meeting(x, (y - 1), obj_player2) || place_meeting((x - 1), y, obj_player2) || place_meeting((x + 1), y, obj_player2))
{
    if (place_meeting(x, (y - 1), obj_player2) && (obj_player2.state == (108 << 0) || obj_player2.state == (76 << 0)) && obj_player2.freefallsmash >= 10)
    {
        playerindex = 1
        instance_destroy()
    }
    if (obj_player2.state == (41 << 0) && obj_player2.movespeed >= 13 && obj_player2.sprite_index != spr_player_chainsawcrouch)
        instance_destroy()
    if (place_meeting(x, (y - 1), obj_player2) && (obj_player2.state == (47 << 0) || obj_player2.state == (19 << 0)))
    {
        playerindex = 1
        instance_destroy()
    }
}
