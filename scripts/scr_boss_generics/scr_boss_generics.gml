function scr_boss_grabbed() //scr_boss_grabbed
{
    if pizzahead
    {
        instance_destroy(obj_peppermanGIANTbowlingball)
        instance_destroy(obj_peppermanartdude)
        instance_destroy(obj_peppermanbowlingball)
        instance_destroy(obj_peppermanbowlingballspawner)
        instance_destroy(obj_vigilantecow)
        instance_destroy(obj_cowstampede)
        instance_destroy(obj_vigilanteshot)
    }
    var playerid = (grabbedby == 1 ? obj_player1.id : obj_player2.id)
    with (playerid)
    {
        if (state != (262 << 0) || baddiegrabbedID != -2)
        {
            if (other.elitehit <= 1 && other.object_index != obj_pizzafaceboss)
                other.destroyable = 1
            if (other.object_index != obj_pepperman || other.elitehit < 5)
                punchcount = (20 - (other.elitehit * 2))
            else
                punchcount = 20
            pizzahead = other.pizzahead
            subhpshot_max = floor((punchcount / (other.pizzahead_maxsubhp + 1)))
            subhpshot = subhpshot_max
            hiteffect = 1
            reposition = 0
            if (!other.pizzahead)
            {
                punchcount = 0
                hiteffect = 0
            }
            else if ((xscale > 0 && x > (room_width - 100)) || (xscale < 0 && x < 100))
                reposition = 1
            supergrabx = (other.x - x)
            supergraby = (other.y - y)
            camzoom = other.camzoom
            baddiegrabbedID = other.id
            state = (262 << 0)
            supergrabstate = (80 << 0)
            sprite_index = choose(spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, spr_suplexmash5, spr_suplexmash6, spr_suplexmash7)
            image_index = (sprite_get_number(sprite_index) - 1)
            other.camzoom = 1
        }
    }
    image_xscale = (-playerid.xscale)
    sprite_index = grabbedspr
    state = (262 << 0)
}

function scr_boss_pizzaheadjump() //scr_boss_pizzaheadjump
{
    if (object_index != obj_noisey)
        hsp = 0
    if (vsp < 0)
    {
        use_collision = 0
        x += hsp
        y += vsp
        if (vsp < 20)
            vsp += grav
    }
    else
        use_collision = 1
    if (floor(image_index) == (image_number - 1))
    {
        switch sprite_index
        {
            case spr_playerV_jump:
                sprite_index = spr_playerV_fall
                break
            case 801:
                sprite_index = spr_lonegustavo_jump
                break
            case 3960:
                sprite_index = spr_player_ratmountgroundpoundfall
                break
            case 1366:
                sprite_index = spr_playerN_fall
                break
            case 2691:
                sprite_index = spr_fakepeppino_fall
                break
        }

    }
    if (grounded && vsp > 0)
    {
        state = (134 << 0)
        if (object_index == obj_noisey)
        {
            state = (138 << 0)
            stunned = 0
        }
    }
}

function boss_update_pizzaheadKO(argument0, argument1) //boss_update_pizzaheadKO
{
    if (pizzahead && pizzaheadKO && (!instance_exists(pizzaheadKO_ID)))
    {
        pizzaheadKO = 0
        elitehit = 4
        prevhp = elitehit
        with (obj_bosscontroller)
        {
            boss_hpsprite = argument0
            boss_palette = argument1
        }
        image_alpha = 1
        if (state == (298 << 0))
            state = (134 << 0)
    }
}

function boss_hurt_gustavo() //boss_hurt_gustavo
{
    if pizzahead
    {
        with (obj_gustavograbbable)
        {
            var _slam = (enemy_is_superslam(id) || enemy_is_swingding(id))
            if ((thrown || _slam) && other.state != (298 << 0) && (place_meeting((x + hsp), y, other) || place_meeting((x - image_xscale), y, other) || place_meeting((x - (32 * image_xscale)), y, other) || place_meeting((x + (32 * image_xscale)), y, other)))
            {
                with (other)
                {
                    state = (138 << 0)
                    stunned = 1000
                    thrown = 0
                    savedthrown = 0
                    if (other.hsp != 0)
                        image_xscale = (-sign(other.hsp))
                    hsp = ((-image_xscale) * 8)
                    vsp = -4
                    instance_destroy(other)
                }
                if _slam
                {
                    with (obj_player)
                        baddiegrabbedID = -4
                    instance_destroy()
                }
            }
        }
    }
}

function boss_do_pizzaheadKO() //boss_do_pizzaheadKO
{
    if (pizzahead && pizzaheadKO && state != (294 << 0) && elitehit <= 3)
    {
        pizzaheadKO_buffer = 5
        state = (298 << 0)
        image_alpha = 1
    }
}

function scr_boss_pizzaheadKO() //scr_boss_pizzaheadKO
{
    if grounded
        hsp = Approach(hsp, 0, 0.2)
    switch object_index
    {
        case obj_vigilanteboss:
            sprite_index = spr_playerV_hurt
            break
        case 480:
            sprite_index = spr_playerN_hurt
            break
        case 10:
            sprite_index = spr_fakepeppino_vulnerable
            break
    }

    if (pizzaheadKO_buffer > 0)
        pizzaheadKO_buffer = 0
    else
    {
        pizzaheadKO_buffer = 5
        if (image_alpha == 1)
            image_alpha = 0
        else
            image_alpha = 1
    }
}

function scr_boss_genericintro(argument0) //scr_boss_genericintro
{
    if (sprite_index != argument0)
    {
        sprite_index = argument0
        introbuffer = 30
    }
    if (introbuffer > 30)
        introbuffer = 30
    with (obj_player1)
    {
        state = (146 << 0)
        image_speed = 0.35
        hsp = 0
        movespeed = 0
        flash = 0
        x = roomstartx
        xscale = (-other.image_xscale)
        sprite_index = spr_idle
    }
    with (obj_player2)
        visible = false
    if (introbuffer > 0)
        introbuffer--
    else
    {
        state = (134 << 0)
        if instance_exists(spotlightID)
            spotlightID.expand = 1
        with (obj_player)
        {
            state = (0 << 0)
            sprite_index = spr_idle
        }
    }
}

function scr_boss_do_hurt_phase2(argument0, argument1) //scr_boss_do_hurt_phase2
{
    if (argument1 == undefined)
        argument1 = 100
    with (argument0)
    {
        state = (273 << 0)
        invtime = (argument1 + 40)
        hurted = 0
        image_alpha = 1
        alarm[5] = -1
        alarm[6] = -1
        alarm[8] = -1
        event_perform(ev_alarm, 7)
        sprite_index = spr_finishingblow1
        image_index = 0
        hitX = x
        hitY = y
    }
    pulse = 0
    state = (273 << 0)
    buildup = argument1
    buildup_playerID = argument0
    camzoom = 1
    flashbuffer = (argument1 - 40)
    fmod_event_one_shot("event:/sfx/misc/blackoutpunch")
    instance_create_unique(0, 0, 121)
    instance_create_unique(0, 0, 342)
    image_xscale = (-argument0.xscale)
    instance_create(0, 0, obj_bossdark)
}

function scr_boss_phase1hurt(argument0) //scr_boss_phase1hurt
{
    if (argument0 == undefined)
        argument0 = -4
    var player = buildup_playerID
    var px = (player.x + (player.xscale * 60))
    var py = player.y
    if (sprite_index == stunfallspr)
        py += 25
    image_speed = 0
    if (flashbuffer > 0)
        flashbuffer--
    else if (flashbuffer == 0)
    {
        flashbuffer = -1
        with (player)
        {
            with (instance_create((x - (xscale * 61)), (y - 21), obj_explosioneffect))
            {
                depth = -12
                fmod_event_one_shot("event:/sfx/ending/star")
                sprite_index = choose(spr_bossfight_blackoutpunch1, spr_bossfight_blackoutpunch2)
                image_speed = 0.3
            }
        }
    }
    if (buildup > 0)
    {
        camzoom = lerp(camzoom, 0.5, 0.1)
        obj_screensizer.camzoom = camzoom
        camera_set_view_size(view_camera[0], (obj_screensizer.actual_width * camzoom), (obj_screensizer.actual_height * camzoom))
        x = px
        y = py
        buildup--
        with (player)
        {
            invtime = 30
            vsp = 0
            x = hitX
            y = hitY
            image_index = 0
            image_speed = 0
        }
    }
    else
    {
        instance_destroy(obj_superattackeffect)
        instance_destroy(obj_blackoutline)
        camzoom = lerp(camzoom, 1, 0.5)
        obj_screensizer.camzoom = camzoom
        camera_set_view_size(view_camera[0], (obj_screensizer.actual_width * camzoom), (obj_screensizer.actual_height * camzoom))
        with (player)
        {
            if (state != (6 << 0))
            {
                state = (6 << 0)
                image_speed = 0.35
                image_index = 0
                hsp = 0
                movespeed = 0
            }
        }
        x = px
        y = py
        if floor(player.image_index >= 4)
        {
            var lag = 15
            hitLag = lag
            hitX = x
            hitY = y
            player.movespeed = 0
            player.hitLag = lag
            player.hitX = player.x
            player.hitY = player.y
            instance_create(x, y, obj_parryeffect)
            GamepadSetVibration((player.object_index == obj_player1 ? 0 : 1), 0.8, 0.65)
            fmod_event_one_shot_3d("event:/sfx/enemies/killingblow", x, y)
            fmod_event_one_shot_3d("event:/sfx/pep/punch", x, y)
            state = (138 << 0)
            image_xscale = (-player.xscale)
            instance_create(x, y, obj_slapstar)
            instance_create(x, y, obj_slapstar)
            instance_create(x, y, obj_slapstar)
            instance_create(x, y, obj_baddiegibs)
            instance_create(x, y, obj_baddiegibs)
            instance_create(x, y, obj_baddiegibs)
            instance_create(x, y, obj_bangeffect)
            instance_destroy(obj_bossdark)
            repeat (4)
            {
                with (create_debris((x + random_range(-64, 64)), (y + random_range(-64, 64)), 4030, 1))
                {
                    hsp = random_range(-5, 5)
                    vsp = random_range(-10, 10)
                    image_speed = 0.4
                }
            }
            camera_set_view_size(view_camera[0], obj_screensizer.actual_width, obj_screensizer.actual_height)
            obj_screensizer.camzoom = 1
            create_heatattack_afterimage(x, y, sprite_index, image_index, image_xscale)
            with (obj_camera)
            {
                shake_mag = 3
                shake_mag_acc = (5 / room_speed)
            }
            with (player)
            {
                other.hithsp = (other.image_xscale * 25)
                other.hitvsp = -8
                vsp = -6
                hsp = ((-xscale) * 4)
                movespeed = 4
                state = (91 << 0)
            }
            check_grabbed_solid(player)
            check_grabbed_solid(player)
            hsp = hithsp
            vsp = hitvsp
            thrown = 1
            linethrown = 1
            image_speed = 0.35
        }
    }
}

