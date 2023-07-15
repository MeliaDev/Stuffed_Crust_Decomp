if ((!instance_exists(baddieID)) && room != custom_lvl_room)
    instance_destroy()
if instance_exists(baddieID)
{
    x = baddieID.x
    y = baddieID.y
    image_xscale = baddieID.image_xscale
    persistent = baddieID.persistent
}
if (instance_exists(baddieID) && place_meeting(x, y, obj_player) && obj_player.cutscene == 0)
{
    if (baddieID.state != (4 << 0) && (!baddieID.invincible) && baddieID.state != (17 << 0))
    {
        with (obj_player)
        {
            var _obj_player = id
            var _playerindex = (object_index == obj_player1 ? 1 : 2)
            if (instance_exists(other.baddieID) && y < other.baddieID.y && other.baddieID.stompbuffer <= 0 && attacking == 0 && (!global.kungfu) && sprite_index != spr_mach2jump && ((state == (3 << 0) && vsp > 0) || (character == "S" && movespeed > 8) || state == (56 << 0) || state == (92 << 0) || (isgustavo && ratmount_movespeed < 12 && state == (192 << 0)) || state == (103 << 0) || state == (79 << 0)) && vsp > 0 && sprite_index != spr_stompprep && (!other.baddieID.invincible) && other.baddieID.stompable)
            {
                fmod_event_one_shot_3d("event:/sfx/enemies/stomp", x, y)
                image_index = 0
                other.baddieID.stompbuffer = 15
                if (other.baddieID.object_index != obj_tank)
                {
                    if (x != other.baddieID.x)
                        other.baddieID.image_xscale = (-(sign((other.baddieID.x - x))))
                    other.baddieID.hsp = (obj_player1.xscale * 5)
                    if (other.baddieID.vsp >= 0 && other.baddieID.grounded)
                        other.baddieID.vsp = -5
                    other.baddieID.state = (138 << 0)
                    if (other.baddieID.stunned < 100)
                        other.baddieID.stunned = 100
                    other.baddieID.xscale = 1.4
                    other.baddieID.yscale = 0.6
                }
                if (other.baddieID.object_index == obj_pizzaball)
                {
                    with (other.baddieID)
                        global.golfhit++
                }
                if (key_jump2 || input_buffer_jump > 0)
                {
                    instance_create(x, (y + 50), obj_stompeffect)
                    stompAnim = 1
                    vsp = -14
                    if (state == (92 << 0))
                    {
                        jumpstop = 1
                        sprite_index = spr_stompprep
                    }
                }
                else
                {
                    instance_create(x, (y + 50), obj_stompeffect)
                    stompAnim = 1
                    vsp = -9
                    if (state == (92 << 0))
                    {
                        jumpstop = 1
                        sprite_index = spr_stompprep
                    }
                }
                if isgustavo
                {
                    jumpAnim = 1
                    jumpstop = 1
                    with (other.baddieID)
                    {
                        elitehit = 0
                        instance_destroy()
                    }
                    if brick
                        sprite_index = spr_player_ratmountmushroombounce
                    else
                        sprite_index = spr_lonegustavo_jumpstart
                    state = (192 << 0)
                    image_index = 0
                }
                if (state == (56 << 0))
                {
                    vsp = -9
                    jumpAnim = 1
                    jumpstop = 1
                    sprite_index = spr_player_chainsawpogobounce
                    image_index = 0
                    with (other.baddieID)
                    {
                        elitehit = 0
                        instance_destroy()
                    }
                }
            }
            if (instance_exists(other.baddieID) && other.baddieID.invtime == 0 && ((other.baddieID.object_index != obj_bigcheese && other.baddieID.object_index != obj_pepbat) || state != (5 << 0)) && ((state == (42 << 0) && (global.attackstyle == 1 || shotgunAnim)) || instakillmove == 1) && other.baddieID.state != (4 << 0) && (!other.baddieID.invincible) && other.baddieID.instantkillable)
                Instakill()
            else if (instance_exists(other.baddieID) && state == (42 << 0) && character != "S" && global.attackstyle == 0 && other.baddieID.invtime <= 0 && (!other.baddieID.invincible))
            {
                swingdingthrow = 0
                image_index = 0
                if (!key_up)
                {
                    if (movespeed <= 10)
                        sprite_index = spr_haulingstart
                    else
                        sprite_index = spr_swingding
                    if (!grounded)
                        vsp = -6
                    swingdingendcooldown = 0
                    state = (79 << 0)
                    baddiegrabbedID = other.baddieID
                    grabbingenemy = 1
                    heavy = other.baddieID.heavy
                    other.baddieID.state = (4 << 0)
                    other.baddieID.grabbedby = _playerindex
                    with (other.baddieID)
                    {
                        if (object_index == obj_pepperman || object_index == obj_noiseboss || object_index == obj_vigilanteboss || object_index == obj_pizzafaceboss || object_index == obj_fakepepboss || object_index == obj_pizzafaceboss_p3)
                            scr_boss_grabbed()
                    }
                }
                else if key_up
                {
                    baddiegrabbedID = other.baddieID
                    grabbingenemy = 1
                    other.baddieID.state = (4 << 0)
                    other.baddieID.grabbedby = _playerindex
                    sprite_index = spr_piledriver
                    vsp = -14
                    state = (76 << 0)
                    image_index = 0
                    image_speed = 0.35
                }
            }
            else if (state == (42 << 0) && global.attackstyle == 3 && (!other.baddieID.invincible))
            {
                var _ms = movespeed
                movespeed = 0
                baddiegrabbedID = other.baddieID
                grabbingenemy = 1
                var _prevstate = other.baddieID.state
                other.baddieID.state = (4 << 0)
                other.baddieID.grabbedby = _playerindex
                heavy = other.baddieID.heavy
                if global.pummeltest
                {
                    if (image_index > 6)
                    {
                        if key_up
                        {
                            state = (6 << 0)
                            sprite_index = spr_uppercutfinishingblow
                            image_index = 4
                            movespeed = 0
                        }
                        else if key_down
                        {
                            sprite_index = spr_piledriver
                            vsp = -5
                            state = (76 << 0)
                            image_index = 4
                            image_speed = 0.35
                        }
                        else
                        {
                            state = (6 << 0)
                            sprite_index = spr_player_lungehit
                            image_index = 0
                        }
                    }
                    else
                    {
                        other.baddieID.state = _prevstate
                        grabbingenemy = 0
                        movespeed = _ms
                    }
                }
                else
                {
                    image_index = 0
                    if key_up
                    {
                        state = (6 << 0)
                        sprite_index = spr_uppercutfinishingblow
                        image_index = 4
                        movespeed = 0
                    }
                    else if key_down
                    {
                        sprite_index = spr_piledriver
                        vsp = -5
                        state = (76 << 0)
                        image_index = 4
                        image_speed = 0.35
                    }
                    else
                    {
                        state = (6 << 0)
                        sprite_index = spr_player_lungehit
                        image_index = 0
                    }
                }
            }
            if (place_meeting(x, (y + 1), other) && state == (58 << 0) && vsp > 0 && other.baddieID.vsp >= 0 && sprite_index != spr_playerN_pogobounce && (!other.baddieID.invincible))
            {
                switch pogochargeactive
                {
                    case 0:
                        pogospeedprev = 0
                        other.baddieID.vsp = -3
                        fmod_event_one_shot_3d("event:/sfx/enemies/stomp", x, y)
                        other.baddieID.state = (138 << 0)
                        if (other.baddieID.stunned < 100)
                            other.baddieID.stunned = 100
                        sprite_index = spr_playerN_pogobounce
                        break
                    case 1:
                        pogospeedprev = 0
                        scr_throwenemy()
                        sprite_index = spr_playerN_pogobouncemach
                        break
                }

                instance_create(x, (y + 50), obj_stompeffect)
                image_index = 0
                movespeed = 0
                vsp = 0
            }
            var pepp_grab = 0
            if (character == "M" && instance_exists(other.baddieID) && (state == (0 << 0) || state == (92 << 0)) && pepperman_grabID == -4 && sprite_index != spr_pepperman_throw && other.baddieID.state == (138 << 0) && other.baddieID.stuntouchbuffer == 0 && (!other.baddieID.thrown) && (!other.baddieID.invincible))
            {
                other.baddieID.pepperman_grab = 1
                pepperman_grabID = other.baddieID.id
                other.baddieID.state = (4 << 0)
                other.baddieID.grabbedby = _playerindex
                pepp_grab = 1
            }
            if (instance_exists(other.baddieID) && other.baddieID.object_index != obj_bigcheese && state != (61 << 0) && ((character == "S" && movespeed > 4) || state == (5 << 0) || state == (104 << 0) || state == (105 << 0) || sprite_index == spr_player_ratmountattack || sprite_index == spr_lonegustavo_dash) && other.baddieID.state != (80 << 0) && other.baddieID.state != (137 << 0) && (!pepp_grab) && other.baddieID.thrown == 0 && other.baddieID.stuntouchbuffer <= 0 && other.baddieID.state != (4 << 0) && other.baddieID.state != (41 << 0) && other.baddieID.state != (61 << 0) && (!other.baddieID.invincible))
            {
                var lag = 2
                other.baddieID.stuntouchbuffer = 15
                with (other.baddieID)
                {
                    fmod_event_one_shot_3d("event:/sfx/pep/mach2bump", x, y)
                    xscale = 0.8
                    yscale = 1.3
                    instance_create(x, y, obj_bangeffect)
                    if (object_index == obj_chilidude)
                    {
                        image_xscale = other.xscale
                        stuntimer = stunmax
                        state = (5 << 0)
                        if (other.movespeed > 7)
                            tumblespeed = other.movespeed
                        machtumble = 1
                    }
                    else
                    {
                        state = (137 << 0)
                        image_xscale = (-other.xscale)
                        hithsp = (obj_player1.xscale * 12)
                        hitvsp = (((other.y - 180) - y) / 60)
                        hitLag = lag
                        hitX = x
                        hitY = y
                        invtime = (lag + 5)
                        mach2 = 1
                    }
                }
                tauntstoredstate = state
                tauntstoredsprite = sprite_index
                tauntstoredmovespeed = movespeed
                tauntstoredvsp = vsp
                state = (61 << 0)
                hitLag = lag
                global.combotimepause = 15
                hitX = x
                hitY = y
                repeat (2)
                {
                    with (create_debris(x, y, 1531))
                        vsp = irandom_range(-6, -11)
                }
            }
            if (character != "M" && instance_exists(other.baddieID) && state == (55 << 0) && (!other.baddieID.invincible))
            {
                if (instance_exists(other.baddieID) && y < (other.baddieID.y - 50) && attacking == 0 && state != (42 << 0) && other.baddieID.state != (4 << 0) && sprite_index != spr_mach2jump && (state == (92 << 0) || state == (103 << 0) || (state == (79 << 0) && sprite_index != spr_swingding)) && vsp > 0 && (other.baddieID.vsp >= 0 || other.baddieID.object_index == obj_farmerbaddie || other.baddieID.object_index == obj_farmerbaddie2 || other.baddieID.object_index == obj_farmerbaddie3) && sprite_index != spr_stompprep && (!other.baddieID.invincible))
                {
                    fmod_event_one_shot_3d("event:/sfx/enemies/stomp", x, y)
                    if (x != other.baddieID.x)
                        other.baddieID.image_xscale = (-(sign((other.baddieID.x - x))))
                    image_index = 0
                    other.baddieID.state = (138 << 0)
                    if (other.baddieID.stunned < 100)
                        other.baddieID.stunned = 100
                    instance_create(x, (y + 50), obj_stompeffect)
                    stompAnim = 1
                    other.baddieID.image_index = 0
                    if key_jump2
                        vsp = -14
                    else
                        vsp = -9
                    if (state != (79 << 0))
                        sprite_index = spr_stompprep
                }
                if (other.baddieID.thrown == 0 && character != "S" && (!other.baddieID.invincible))
                {
                    movespeed = 0
                    image_index = 0
                    sprite_index = spr_haulingstart
                    heavy = other.baddieID.heavy
                    state = (79 << 0)
                    other.baddieID.state = (4 << 0)
                    other.baddieID.grabbedby = _playerindex
                }
            }
        }
    }
}
