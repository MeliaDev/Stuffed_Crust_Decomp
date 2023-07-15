function scr_player_chainsaw() //scr_player_chainsaw
{
    hsp = 0
    vsp = 0
    x = (hitX + random_range(-4, 4))
    y = (hitY + random_range(-4, 4))
    hitLag--
    if key_slap2
        input_buffer_slap = 0
    image_speed = 0
    if key_slap2
        input_attack_buffer = 8
    if (hitLag <= 0)
    {
        x = hitX
        y = hitY
        movespeed = tauntstoredmovespeed
        sprite_index = tauntstoredsprite
        state = tauntstoredstate
        vsp = tauntstoredvsp
        if (global.attackstyle == 0)
        {
            if ((tauntstoredstate == (42 << 0) && (tauntstoredsprite == spr_player_suplexgrabjumpstart || tauntstoredsprite == spr_player_suplexgrabjump || tauntstoredsprite == spr_player_airattack || tauntstoredsprite == spr_player_airattackstart)) || sprite_index == spr_piledriverland || sprite_index == spr_player_faceplant || sprite_index == spr_playerN_suplexdash_GOLF)
            {
                jumpAnim = 1
                state = (92 << 0)
                if (sprite_index == spr_player_faceplant || sprite_index == spr_playerN_suplexdash_GOLF)
                {
                    if ispeppino
                        sprite_index = spr_player_lungehit
                    else
                        sprite_index = spr_playerN_spin
                }
                else
                    sprite_index = spr_suplexland
                vsp = -14
                jumpstop = 0
                image_index = 0
            }
            else if (tauntstoredstate == (42 << 0) || tauntstoredstate == (6 << 0))
                state = (0 << 0)
        }
        if (global.attackstyle == 1)
        {
            if ((tauntstoredstate == (42 << 0) && (tauntstoredsprite == spr_player_suplexgrabjumpstart || tauntstoredsprite == spr_player_suplexgrabjump || tauntstoredsprite == spr_player_airattack || tauntstoredsprite == spr_player_airattackstart)) || sprite_index == spr_piledriverland || sprite_index == spr_player_faceplant || sprite_index == spr_playerN_suplexdash_GOLF)
            {
                movespeed = 4
                state = (91 << 0)
                sprite_index = choose(spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, spr_suplexmash5, spr_suplexmash6, spr_suplexmash7, spr_punch)
                image_index = 0
                vsp = -5
            }
            else if (tauntstoredstate == (42 << 0) || tauntstoredstate == (6 << 0))
            {
                movespeed = 4
                state = (91 << 0)
                sprite_index = choose(spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, spr_suplexmash5, spr_suplexmash6, spr_suplexmash7, spr_punch)
                image_index = 0
            }
        }
        if (global.attackstyle == 2)
        {
            if (tauntstoredstate == (43 << 0))
                state = (43 << 0)
        }
    }
}

