function scr_enemy_pummel() //scr_enemy_pummel
{
    var _playerinst = asset_get_index(concat("obj_player", grabbedby))
    sprite_index = stunfallspr
    x = (_playerinst.x + (_playerinst.xscale * 24))
    y = (_playerinst.y + 8)
    image_xscale = sign((_playerinst.x - x))
    with (_playerinst)
    {
        var issprite = (sprite_index == spr_realpunch || sprite_index == spr_suplexmash1 || sprite_index == spr_suplexmash2 || sprite_index == spr_suplexmash3 || sprite_index == spr_suplexmash4 || sprite_index == spr_suplexmash5 || sprite_index == spr_suplexmash6 || sprite_index == spr_suplexmash7)
        var isspecial = (sprite_index == spr_player_slap1 || sprite_index == spr_player_breakdancestart || sprite_index == spr_player_chainsawdash || sprite_index == spr_playerN_spin || sprite_index == spr_playerN_noisebombkick || sprite_index == spr_player_kungfu1 || sprite_index == spr_player_kungfu2 || sprite_index == spr_player_kungfu3 || sprite_index == spr_player_lungeattack || sprite_index == spr_player_lungestart || sprite_index == spr_player_lungehit || sprite_index == spr_player_slaprun1 || sprite_index == spr_player_slaprun2 || sprite_index == spr_diagonalthrowup)
        move = (key_left + key_right)
        if (!isspecial)
        {
            if (!issprite)
            {
                if key_slap
                {
                    if (other.elitehit >= 0)
                    {
                        other.elitehit--
                        image_index = 0
                        if (move != 0)
                            move = xscale
                        randomize_animations([spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, spr_suplexmash5, spr_suplexmash6, spr_suplexmash7])
                        movespeed = 4
                        vsp = -3
                        fmod_event_one_shot_3d("event:/sfx/pep/punch", x, y)
                    }
                    else if (sprite_index != spr_realpunch && sprite_index != spr_finishingblow1 && sprite_index != spr_finishingblow2 && sprite_index != spr_finishingblow3 && sprite_index != spr_finishingblow4 && sprite_index != spr_finishingblow5 && sprite_index != spr_uppercutfinishingblow)
                    {
                        input_buffer_slap = 0
                        if (move != 0)
                            move = xscale
                        hsp = (xscale * movespeed)
                        movespeed = hsp
                        state = (6 << 0)
                        fmod_event_one_shot_3d("event:/sfx/enemies/killingblow", x, y)
                        fmod_event_one_shot_3d("event:/sfx/pep/punch", x, y)
                        if key_up
                            sprite_index = spr_uppercutfinishingblow
                        else
                            sprite_index = choose(spr_finishingblow1, spr_finishingblow2, spr_finishingblow3, spr_finishingblow4, spr_finishingblow5)
                        image_index = 0
                        with (other)
                        {
                            alarm[3] = 3
                            global.hit += 1
                            instance_create(x, (y + 20), obj_bumpeffect)
                            alarm[1] = 5
                            thrown = 1
                            hsp = ((-image_xscale) * 20)
                            vsp = -7
                            state = (138 << 0)
                            global.combotime = 60
                            if (!important)
                                global.style += (5 + (global.combo / 10))
                            flash = 1
                        }
                    }
                    global.heattime += 10
                    global.heattime = clamp(global.heattime, 0, 60)
                    global.combotime += 10
                    global.combotime = clamp(global.combotime, 0, 60)
                    instance_create(x, y, obj_slapstar)
                    instance_create(x, y, obj_baddiegibs)
                    with (obj_camera)
                    {
                        shake_mag = 2
                        shake_mag_acc = (3 / room_speed)
                    }
                }
            }
            if issprite
            {
                if (key_shoot || sprite_index == spr_realpunch)
                {
                    if (character == "P")
                    {
                        if ispeppino
                        {
                            if (global.shootkeyattack == 1)
                            {
                                movespeed = 11
                                fmod_event_one_shot_3d("event:/sfx/pep/suplexdash", x, y)
                                if grounded
                                {
                                    randomize_animations([3584, 3242, 3835, 53, 520, 3714])
                                    vsp = -9
                                }
                                else
                                {
                                    randomize_animations([1831, 2319, 658])
                                    vsp = -7
                                }
                            }
                            if (global.shootkeyattack == 2)
                            {
                                movespeed = 10
                                sprite_index = choose(spr_player_slaprun1, spr_player_slaprun2)
                            }
                            if (global.shootkeyattack == 3)
                            {
                                vsp = -6
                                movespeed = 9
                                sprite_index = spr_player_breakdancestart
                            }
                            if (global.shootkeyattack == 4)
                            {
                                vsp = -4
                                movespeed = 10
                                sprite_index = spr_player_chainsawdash
                            }
                        }
                        else
                        {
                            fmod_event_one_shot_3d("event:/sfx/noise/spin", x, y)
                            movespeed = 12
                            vsp = -6
                            sprite_index = spr_playerN_spin
                        }
                        if (global.shootkeyattack > 0)
                            movespeed += (throwforce / 6)
                    }
                    if (character == "N")
                    {
                        movespeed = 12
                        vsp = -6
                        sprite_index = spr_playerN_noisebombkick
                    }
                    fmod_event_one_shot_3d("event:/sfx/pep/punch", x, y)
                    global.heattime += 10
                    global.heattime = clamp(global.heattime, 0, 60)
                    global.combotime += 10
                    global.combotime = clamp(global.combotime, 0, 60)
                    image_index = 0
                    with (obj_camera)
                    {
                        shake_mag = 2
                        shake_mag_acc = (3 / room_speed)
                    }
                    instance_create(x, y, obj_highjumpcloud2)
                    instance_create(x, y, obj_slapstar)
                    instance_create(x, y, obj_baddiegibs)
                    with (other)
                    {
                        if (other.sprite_index == other.spr_realpunch)
                            elitehit = 0
                        else
                            elitehit -= 2
                        state = (138 << 0)
                        hsp = ((-image_xscale) * 8)
                        vsp = -11
                    }
                }
                else if key_up
                {
                    global.heattime += 10
                    global.heattime = clamp(global.heattime, 0, 60)
                    global.combotime += 10
                    global.combotime = clamp(global.combotime, 0, 60)
                    image_index = 0
                    sprite_index = spr_diagonalthrowup
                    fmod_event_one_shot_3d("event:/sfx/pep/punch", x, y)
                    with (obj_camera)
                    {
                        shake_mag = 2
                        shake_mag_acc = (3 / room_speed)
                    }
                    with (other)
                    {
                        elitehit -= 2
                        state = (138 << 0)
                        hsp = ((-image_xscale) * 10)
                        vsp = -15
                    }
                }
                else if key_down
                {
                    global.heattime += 10
                    global.heattime = clamp(global.heattime, 0, 60)
                    global.combotime += 10
                    global.combotime = clamp(global.combotime, 0, 60)
                    image_index = 0
                    sprite_index = spr_diagonalthrowdown
                    fmod_event_one_shot_3d("event:/sfx/pep/punch", x, y)
                    with (obj_camera)
                    {
                        shake_mag = 2
                        shake_mag_acc = (3 / room_speed)
                    }
                    with (other)
                    {
                        elitehit -= 2
                        state = (138 << 0)
                        hsp = ((-image_xscale) * 10)
                        vsp = 8
                    }
                }
            }
        }
    }
}

function scr_enemy_stunTEST() //scr_enemy_stunTEST
{
    sprite_index = stunfallspr
    image_speed = 0.35
    if (place_meeting((x - sign(image_xscale)), y, obj_solid) || grounded)
    {
        if thrown
        {
            if destroyable
                instance_destroy()
        }
        else
        {
            hsp = 0
            grav = 0.5
        }
    }
}

function scr_enemy_staggered() //scr_enemy_staggered
{
    sprite_index = stunfallspr
    if (stuntouchbuffer > 0)
        stuntouchbuffer--
    if (stagger_buffer > 0)
    {
        hsp = 0
        stagger_buffer--
    }
    else if (stagger_buffer == 0)
    {
        vsp = (-stagger_jumpspeed)
        hsp = (stagger_dir * stagger_movespeed)
        stagger_buffer = -1
    }
    else if (floor(image_index) == (image_number - 1) && grounded)
    {
        image_index = 0
        if (object_index != obj_cheeseslime)
            sprite_index = walkspr
        else
            sprite_index = spr_slimerecovery
        state = (134 << 0)
    }
}

