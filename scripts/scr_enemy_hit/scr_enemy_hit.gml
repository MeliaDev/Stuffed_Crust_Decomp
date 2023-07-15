function scr_enemy_hit() //scr_enemy_hit
{
    x = (hitX + random_range(-6, 6))
    y = (hitY + random_range(-6, 6))
    hitLag--
    sprite_index = stunfallspr
    if (object_index == obj_pepperman || object_index == obj_vigilanteboss || object_index == obj_noiseboss || object_index == obj_pf_fakepep || object_index == obj_fakepepboss || object_index == obj_pizzafaceboss || object_index == obj_pizzafaceboss_p3)
    {
        if (player_instakillmove && pizzahead && object_index != obj_gustavograbbable)
        {
            obj_player1.baddiegrabbedID = id
            scr_boss_grabbed()
        }
    }
    if thrown
    {
        angle += (5 * image_xscale)
        with (place_meeting((x + ((hsp + 32) * image_xscale)), (y + ((vsp + 32) * image_yscale)), obj_baddie))
        {
            elitehit = 0
            hp = 0
            instance_destroy()
        }
    }
    else
        angle = 0
    if (hitLag <= 0)
    {
        x = hitX
        y = hitY
        var _player = -4
        if (grabbedby == 1)
            _player = obj_player1.id
        else if (grabbedby == 2)
            _player = obj_player2.id
        var _state = obj_player.state
        if (_state == (61 << 0))
            _state = obj_player.tauntstoredstate
        if (_state == (104 << 0) || _state == (5 << 0) || (_state == (105 << 0) && obj_player.sprite_index != obj_player.spr_mach3boost && obj_player.sprite_index != spr_player_machslideboost3fall) || sprite_index == spr_player_ratmountattack || sprite_index == spr_lonegustavo_dash)
            thrown = 0
        else
            thrown = 1
        vsp = hitvsp
        hsp = hithsp
        global.hit += 1
        if (other.object_index == obj_pizzaball)
            global.golfhit += 1
        if thrown
            global.combotime = 60
        global.heattime = 60
        alarm[1] = 5
        var _hp = 0
        if ((global.attackstyle == 3 || global.attackstyle == 0) && (!global.kungfu))
            _hp = -1
        if (place_meeting(((x + hsp) + (12 * sign(hsp))), ((y + vsp) + (12 * sign(vsp))), obj_solid) || place_meeting(((x + hsp) + (12 * sign(hsp))), ((y + vsp) + (12 * sign(vsp))), obj_metalblock) || place_meeting(((x + hsp) + (12 * sign(hsp))), ((y + vsp) + (12 * sign(vsp))), obj_hotmetalblock))
        {
            elitehit = 0
            hp = 0
            instance_destroy()
        }
        if (hp <= _hp && object_get_parent(object_index) != 20 && (!((object_index == obj_pepperman || object_index == obj_vigilanteboss || object_index == obj_noiseboss || object_index == obj_pf_fakepep || object_index == obj_fakepepboss || object_index == obj_pizzafaceboss || object_index == obj_pizzafaceboss_p3))) && destroyable && (!mach2))
        {
            elitehit = 0
            instance_destroy()
            instance_create(x, y, obj_genericpoofeffect)
        }
        stunned = 200
        state = (138 << 0)
        if (object_index == obj_pepperman || object_index == obj_vigilanteboss || object_index == obj_noiseboss || object_index == obj_pf_fakepep || object_index == obj_fakepepboss || object_index == obj_pizzafaceboss || object_index == obj_pizzafaceboss_p3)
        {
            if (obj_player.tauntstoredstate != (80 << 0) && obj_player.tauntstoredstate != (108 << 0) && obj_player.tauntstoredstate != (76 << 0))
            {
                linethrown = 1
                var f = 15
                if (obj_player.tauntstoredstate == (121 << 0))
                    f = 25
                if (abs(hithsp) > abs(hitvsp))
                {
                    if (abs(hithsp) < f)
                        hithsp = (sign(hithsp) * f)
                }
                else if (abs(hitvsp) < f)
                    hitvsp = (sign(hitvsp) * f)
            }
            else if (!pizzahead)
            {
                hithsp = (22 * (-obj_player1.xscale))
                hitvsp = -7
                hsp = hithsp
                vsp = hitvsp
                flash = 0
                state = (138 << 0)
                thrown = 1
                linethrown = 0
            }
            if (_state == (104 << 0) || _state == (5 << 0))
                stunned *= 5
        }
        if mach2
            thrown = 0
        mach2 = 0
    }
}

