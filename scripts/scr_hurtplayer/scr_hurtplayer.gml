function scr_hurtplayer(argument0) //scr_hurtplayer
{
    var _obj = object_index
    var _other = id
    var _savedstate = argument0.state
    var _hurt = 0
    with (argument0)
    {
        if global.failcutscene
        {
        }
        else if (state == (196 << 0) || state == (262 << 0) || state == (231 << 0) || state == (147 << 0) || instance_exists(obj_vigilante_duelintro) || state == (119 << 0) || state == (292 << 0) || state == (150 << 0) || state == (154 << 0) || state == (208 << 0) || state == (148 << 0) || state == (165 << 0))
        {
        }
        else if (global.noisejetpack == 1)
        {
        }
        else if (holycross > 0 || invtime > 0)
        {
        }
        else if (sprite_index == spr_player_jetpackstart2)
        {
        }
        else if ((state == (84 << 0) && (parrytimer > 0 || instance_exists(obj_parryhitbox) || sprite_index == spr_supertaunt1 || sprite_index == spr_supertaunt2 || sprite_index == spr_supertaunt3 || sprite_index == spr_supertaunt4 || sprite_index == spr_supertaunt5 || sprite_index == spr_player_ratmountsupertaunt)) || state == (61 << 0) || state == (273 << 0) || state == (146 << 0) || instance_exists(obj_bossdark))
        {
            if (state == (84 << 0))
                trace(parrytimer)
        }
        else if global.kungfu
        {
            if (state == (206 << 0))
            {
                if (sprite_index != spr_player_airattackstart)
                {
                    instance_create(x, y, obj_parryeffect)
                    image_index = 0
                }
                sprite_index = spr_player_airattackstart
                hsp = ((-xscale) * 2)
            }
            else if (state != (156 << 0) && state != (137 << 0) && (!hurted))
            {
                instance_create(x, y, obj_parryeffect)
                repeat (5)
                {
                    with (create_debris(x, y, 1531))
                        vsp = irandom_range(-6, -11)
                }
                hitLag = 3
                hitxscale = (x != other.x ? sign((other.x - x)) : (-other.image_xscale))
                state = (137 << 0)
                hitstunned = 50
                hurted = 1
                alarm[7] = (hitstunned + 30)
                hithsp = 12
                hitvsp = -5
                hitX = x
                hitY = y
                sprite_index = spr_hurt
                if (global.hp > 1)
                {
                    global.hp--
                    with (obj_camera)
                        healthshaketime = 60
                }
                else
                {
                    with (obj_music)
                        arena = 0
                    global.kungfu = 0
                    if (!instance_exists(obj_fadeout))
                    {
                        with (obj_player)
                            targetRoom = lastroom
                        instance_create(x, y, obj_fadeout)
                    }
                }
            }
        }
        else if isgustavo
        {
            if (!hurted)
            {
                if (x != other.x)
                    xscale = sign((other.x - x))
                if (irandom(100) <= 50)
                    fmod_event_one_shot_3d("event:/sfx/voice/gushurt", x, y)
                state = (196 << 0)
                movespeed = 6
                vsp = -9
                flash = 1
                fmod_event_one_shot_3d("event:/sfx/pep/hurt", x, y)
                alarm[8] = 100
                alarm[5] = 2
                alarm[7] = 150
                hurted = 1
                instance_create(x, y, obj_spikehurteffect)
                _hurt = 1
            }
        }
        else if (state == (70 << 0))
        {
        }
        else if ((state == (47 << 0) || state == (48 << 0) || state == (38 << 0) || state == (49 << 0)) && cutscene == 0)
        {
        }
        else if (state == (16 << 0))
        {
        }
        else if (state == (17 << 0))
        {
            if (instance_exists(possessID) && object_get_parent(possessID) == 622)
            {
                state = (16 << 0)
                with (obj_baddie)
                {
                    if (is_controllable && state == (17 << 0) && playerid == other.id)
                        instance_destroy()
                }
            }
        }
        else if (state == (94 << 0))
        {
        }
        else if (state == (187 << 0))
        {
        }
        else if (state == (51 << 0) && hurted == 0)
        {
        }
        else if (state == (31 << 0))
        {
        }
        else if (state == (94 << 0))
        {
        }
        else if (pizzashield == 1)
        {
            pizzashield = 0
            with (instance_create(x, y, obj_sausageman_dead))
                sprite_index = spr_pizzashield_collectible
            hsp = ((-xscale) * 4)
            vsp = -5
            state = (106 << 0)
            if (!isgustavo)
                sprite_index = spr_bump
            else if brick
                sprite_index = spr_player_ratmountbump
            else
                sprite_index = spr_lonegustavo_bump
            invhurt_buffer = 120
            alarm[8] = 60
            alarm[7] = 120
            hurted = 1
            fmod_event_one_shot_3d("event:/sfx/pep/hurt", x, y)
        }
        else if (state != (107 << 0) && state != (196 << 0) && state != (4 << 0) && (hurted == 0 || state == (24 << 0) || state == (29 << 0) || state == (30 << 0)) && cutscene == 0)
        {
            if (state == (225 << 0))
            {
                with (create_debris(x, y, 3494))
                    image_index = 0
                with (create_debris(x, y, 3494))
                    image_index = 1
                with (create_debris(x, y, 3494))
                    image_index = 2
            }
            if (state == (113 << 0) || state == (115 << 0) || state == (114 << 0) || state == (116 << 0))
            {
                repeat (4)
                    create_debris(x, y, 529)
            }
            var _old_xscale = xscale
            if (x != other.x)
                xscale = sign((other.x - x))
            if (state == (11 << 0) || state == (14 << 0) || state == (12 << 0) || state == (13 << 0))
            {
                fmod_event_one_shot_3d("event:/sfx/mort/mortdead", x, y)
                create_debris(x, (y - 40), 2244)
            }
            if instance_exists(obj_hardmode)
                global.heatmeter_count = ((global.heatmeter_threshold - 1) * global.heatmeter_threshold_count)
            _hurt = 1
            pistolanim = -4
            if (character == "V")
                global.playerhealth -= 1
            if global.kungfu
            {
                if (global.hp > 1)
                {
                    global.hp--
                    with (obj_camera)
                        healthshaketime = 60
                }
                else
                {
                    with (obj_music)
                        arena = 0
                    global.kungfu = 0
                    if (!instance_exists(obj_fadeout))
                    {
                        with (obj_player)
                            targetRoom = lastroom
                        instance_create(x, y, obj_fadeout)
                    }
                }
            }
            if (state == (4 << 0))
            {
                if (object_index == obj_player1)
                    y = obj_player2.y
                else
                    y = obj_player1.y
            }
            if (state == (211 << 0) || state == (210 << 0))
                create_debris(x, y, 3377)
            scr_sleep(100)
            fmod_event_one_shot_3d("event:/sfx/pep/hurt", x, y)
            if (irandom(100) <= 50)
            {
                if (character != "S")
                    fmod_event_instance_play(snd_voicehurt)
            }
            instance_create(x, y, obj_bangeffect)
            alarm[8] = 100
            alarm[7] = 150
            hurted = 1
            if (xscale == (-_old_xscale))
            {
                if isgustavo
                {
                    if brick
                        sprite_index = spr_player_ratmounttumble
                    else
                        sprite_index = spr_lonegustavo_hurt
                }
                else
                    sprite_index = spr_hurtjump
            }
            else if isgustavo
            {
                if brick
                    sprite_index = spr_player_ratmounthurt
                else
                    sprite_index = spr_lonegustavo_hurt
            }
            else
                sprite_index = spr_hurt
            movespeed = 8
            vsp = -14
            timeuntilhpback = 300
            pistolanim = -4
            instance_create(x, y, obj_spikehurteffect)
            state = (107 << 0)
            image_index = 0
            flash = 1
            repeat (5)
                instance_create(x, y, obj_hurtstars)
        }
        if _hurt
        {
            notification_push((7 << 0), [argument0.id, _savedstate, _obj])
            global.combotime -= 25
            global.style -= (20 + (global.combo / 10))
            global.hurtcounter += 1
            global.player_damage += 1
            global.vomitamt += 1
            angle = 0
            if (!isgustavo)
                global.peppino_damage += 1
            else
                global.gustavo_damage += 1
            var damage_n = global.peppino_damage
            if isgustavo
                damage_n = global.gustavo_damage
            if (!isgustavo)
            {
                if (character == "V")
                    tv_do_expression(3192)
                else if ((!ispeppino) || character == "N")
                    tv_do_expression(4252)
                else
                    tv_do_expression(1768)
            }
            else
                tv_do_expression(2006)
            if (damage_n == 10)
                tv_do_expression(2061)
            else if (damage_n == 20)
                tv_do_expression(450)
            else if (damage_n == 30)
                tv_do_expression(2917)
            else if (damage_n == 40)
                tv_do_expression(258)
            else if (damage_n == 50)
                tv_do_expression(68)
            else if (damage_n == 60)
                tv_do_expression(567)
            else if (damage_n == 70)
                tv_do_expression(1634)
            else if (damage_n == 80)
                tv_do_expression(1368)
            else if (damage_n == 90)
                tv_do_expression(3631)
            else if (damage_n == 100)
                tv_do_expression(689)
            if (obj_tv.expressionsprite != 1768 && obj_tv.expressionsprite != 2006 && obj_tv.expressionsprite != 4252 && obj_tv.expressionsprite != 3192)
            {
                instance_destroy(obj_transfotip)
                var txt = lang_get_value("peppinohurt")
                if (character == "N" || (character == "P" && ispeppino == 0))
                    txt = lang_get_value("noisehurt")
                if (character == "V")
                    txt = lang_get_value("vigihurt")
                if (character == "S")
                    txt = lang_get_value("snickhurt")
                if isgustavo
                    txt = lang_get_value("gustavohurt")
                txt = embed_value_string(txt, [damage_n])
                create_transformation_tip(txt)
            }
            var loseamount = ((50 + (global.combo * global.heatmeter)) * (global.stylethreshold + 1))
            if instance_exists(obj_bosscontroller)
                loseamount = 0
            if (!global.pizzadelivery)
            {
                if ((!instance_exists(obj_bosscontroller)) && global.collect > 0)
                {
                    with (instance_create(121, 60, obj_negativenumber))
                        number = concat("-", loseamount)
                }
                global.collect -= loseamount
                if (global.collect <= 0)
                    global.collect = 0
                if (global.collect != 0)
                {
                    if (character == "S")
                    {
                        repeat (8 * (global.stylethreshold + 1))
                        {
                            with (instance_create(x, y, obj_gravcollect))
                                sprite_index = spr_snickcollectible1
                        }
                    }
                    else if ((character == "P" && ispeppino) || character == "V" || isgustavo)
                    {
                        repeat (10 * (global.stylethreshold + 1))
                        {
                            with (instance_create(x, y, obj_pizzaloss))
                            {
                                if obj_player1.isgustavo
                                    sprite_index = choose(spr_cheesecollect, spr_eggcollect, spr_fishcollect, spr_paccheesecollect, spr_baconcollect, spr_sausagecollect)
                                if (current_month == 10)
                                    sprite_index = choose(spr_halloweencollectibles1, spr_halloweencollectibles2, spr_halloweencollectibles3, spr_halloweencollectibles4, spr_halloweencollectibles5)
                                else if (current_month == 12)
                                    sprite_index = choose(spr_xmastopping1, spr_xmastopping2, spr_xmastopping3, spr_xmastopping4, spr_xmastopping5)
                                else
                                    sprite_index = choose(spr_shroomcollect, spr_tomatocollect, spr_cheesecollect, spr_sausagecollect, spr_pineapplecollect)
                                if global.panic
                                    sprite_index = choose(spr_fishcollect, spr_bananacollect, spr_shrimpcollect, spr_baconcollect, spr_eggcollect)
                            }
                        }
                    }
                    else
                    {
                        repeat (10 * (global.stylethreshold + 1))
                        {
                            with (instance_create(x, y, obj_pizzaloss))
                            {
                                if global.panic
                                    sprite_index = spr_clockcollectible1
                            }
                        }
                    }
                }
            }
            with (obj_bosscontroller)
            {
                if (!instance_exists(obj_hpeffect))
                {
                    if (!global.boss_invincible)
                    {
                        var n = 1
                        if (room == boss_fakepephallway)
                            n = 2
                        repeat n
                        {
                            var pos = scr_bosscontroller_get_health_pos(player_hp, player_rowmax, player_columnmax, player_maxhp, player_hp_x, player_hp_y, player_xpad, player_ypad)
                            if (obj_player.character == "N" || (obj_player.character == "P" && obj_player.ispeppino == 0))
                            {
                                if (pos != undefined)
                                    scr_bosscontroller_particle_hp(2605, irandom((sprite_get_number(spr_bossfight_noiseHP) - 1)), pos[0], pos[1], 1, 707, obj_player1.paletteselect, global.palettetexture)
                            }
                            else if (pos != undefined)
                                scr_bosscontroller_particle_hp(3641, irandom((sprite_get_number(spr_bossfight_playerhp) - 1)), pos[0], pos[1], 1, 707, obj_player1.paletteselect, global.palettetexture)
                            global.bossplayerhurt = 1
                            player_hp--
                        }
                    }
                }
                else
                {
                    var d = instance_find(obj_hpeffect, (instance_number(obj_hpeffect) - 1))
                    if (obj_player.character == "N" || (obj_player.character == "P" && obj_player.ispeppino == 0))
                        scr_bosscontroller_particle_hp(2605, irandom((sprite_get_number(spr_bossfight_noiseHP) - 1)), d.x, d.y, (d.x > (room_width / 2) ? -1 : 1), 707, obj_player1.paletteselect, global.palettetexture)
                    else
                        scr_bosscontroller_particle_hp(3641, irandom((sprite_get_number(spr_bossfight_playerhp) - 1)), d.x, d.y, (d.x > (room_width / 2) ? -1 : 1), 707, obj_player1.paletteselect, global.palettetexture)
                    instance_destroy(d)
                }
            }
        }
    }
}

