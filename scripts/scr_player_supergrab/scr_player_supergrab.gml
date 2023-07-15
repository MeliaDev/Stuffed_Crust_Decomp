function scr_player_supergrab() //scr_player_supergrab
{
    if pizzahead
    {
        if (supergrabstate != (6 << 0))
            camzoom = lerp(camzoom, 0.5, 0.08)
        else
            camzoom = lerp(camzoom, 1, 0.08)
    }
    else
        camzoom = 1
    invtime = 30
    var midpointX = 0
    var midpointY = 0
    if instance_exists(baddiegrabbedID)
    {
        midpointX = (x + ((baddiegrabbedID.x - x) * 1.15))
        midpointY = (y + ((baddiegrabbedID.y - y) * 0.5))
    }
    switch supergrabstate
    {
        case (80 << 0):
            image_speed = 1
            hsp = Approach(hsp, 0, 0.2)
            vsp = 0
            baddiegrabbedID.image_speed = 0.35
            baddiegrabbedID.x = (x + supergrabx)
            baddiegrabbedID.y = (y + supergraby)
            if (baddiegrabbedID.object_index == obj_pizzafaceboss_p3)
                baddiegrabbedID.y = min(y, 369)
            if (floor(image_index) == (image_number - 1))
            {
                var tx = (xscale * 60)
                var ty = 0
                supergrabx = lerp(supergrabx, tx, 0.5)
                supergraby = lerp(supergraby, ty, 0.5)
                if hiteffect
                {
                    with (instance_create((midpointX + irandom_range(-5, 5)), (midpointY + irandom_range(-5, obj_lightsource)), obj_explosioneffect))
                    {
                        image_speed = 0.4
                        depth = -20
                        sprite_index = choose(spr_pizzaface_hiteffect1, spr_pizzaface_hiteffect2, spr_pizzaface_hiteffect3, spr_pizzaface_hiteffect4)
                    }
                }
                if (punchcount > 0)
                {
                    GamepadSetVibration(0, 0.8, 0.65)
                    if ((xscale > 0 && x > (room_width - 100)) || (xscale < 0 && x < 100))
                        reposition = 1
                    if reposition
                        x = lerp(x, (room_width / 2), 0.05)
                    fmod_event_one_shot_3d("event:/sfx/pep/punch", x, y)
                    hsp = (xscale * 3)
                    punchcount--
                    supergrabstate = (137 << 0)
                    hitX = x
                    hitY = y
                    hitLag = 2
                    tauntstoredmovespeed = hsp
                    with (baddiegrabbedID)
                    {
                        image_speed = 0
                        hitX = x
                        hitY = y
                        if (other.subhpshot > 0)
                            other.subhpshot--
                        else
                        {
                            other.subhpshot = other.subhpshot_max
                            pizzahead_subhp--
                        }
                        repeat (1)
                        {
                            with (create_debris(x, y, 1531))
                            {
                                vsp = (-(irandom_range(8, 11)))
                                hsp = (-(irandom_range(-11, 11)))
                            }
                        }
                        repeat (1)
                        {
                            with (create_debris(x, y, 1525))
                            {
                                vsp = (-(irandom_range(8, 11)))
                                hsp = (-(irandom_range(-11, 11)))
                            }
                        }
                        instance_create((midpointX + irandom_range(-5, 5)), (midpointY + irandom_range(-5, obj_lightsource)), obj_parryeffect)
                    }
                    image_index = 1
                    image_speed = 0
                    randomize_animations([spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, spr_suplexmash5, spr_suplexmash6, spr_suplexmash7])
                    repeat (4 + irandom(6))
                    {
                        var _spd = (5 + irandom(6))
                        with (create_blur_afterimage(x, y, sprite_index, (image_index - 1), xscale))
                        {
                            hsp = choose((-_spd), _spd)
                            vsp = choose((-_spd), _spd)
                            playerid = other.id
                        }
                    }
                }
                else
                {
                    GamepadSetVibration(0, 1, 1, 0.8)
                    var h = -1
                    if (baddiegrabbedID.object_index == obj_pizzafaceboss_p3)
                        h = 1
                    if (baddiegrabbedID.elitehit > h)
                    {
                        with (baddiegrabbedID)
                        {
                            x = (other.x + other.supergrabx)
                            y = (other.y + other.supergraby)
                            if place_meeting(x, y, obj_solid)
                            {
                                x = other.x
                                y = other.y
                                if (object_index == obj_pizzafaceboss_p3)
                                    y = (other.y - 32)
                            }
                            if (object_index == obj_pizzafaceboss)
                            {
                                x = clamp(x, 66, (room_width - 76))
                                y = clamp(y, 65, 382)
                            }
                        }
                        if (baddiegrabbedID.elitehit <= 1 && baddiegrabbedID.object_index != obj_pizzafaceboss_p3)
                            baddiegrabbedID.destroyable = 1
                        if (!ispeppino)
                            sprite_index = choose(spr_playerN_finishingblow1, spr_playerN_finishingblow2, spr_playerN_finishingblow3, spr_playerN_finishingblow4, spr_playerN_parry1)
                        else
                            sprite_index = choose(spr_player_lungehit, spr_player_kungfu1, spr_player_kungfu2, spr_player_kungfu3, spr_player_parry2)
                        image_index = 0
                        supergrabstate = (6 << 0)
                        shot = 0
                    }
                    else
                    {
                        baddiegrabbedID.state = (289 << 0)
                        state = (289 << 0)
                        instance_create((room_width / 2), (room_height / 2), obj_pizzahead_finalecutscene)
                        instance_create(0, 0, obj_pizzahead_whitefade)
                        camzoom = 1
                    }
                }
            }
            break
        case (137 << 0):
            hsp = 0
            vsp = 0
            x = (hitX + irandom_range(-4, 4))
            y = (hitY + irandom_range(-4, 4))
            with (baddiegrabbedID)
            {
                x = (hitX + irandom_range(-4, 4))
                y = (hitY + irandom_range(-4, 4))
            }
            if (hitLag > 0)
                hitLag--
            else
            {
                x = hitX
                y = hitY
                hsp = tauntstoredmovespeed
                supergrabstate = (80 << 0)
                with (baddiegrabbedID)
                {
                    x = hitX
                    y = hitY
                }
            }
            break
        case (6 << 0):
            image_speed = 0.35
            if (!shot)
            {
                hsp = 0
                vsp = 0
            }
            if (floor(image_index) >= 0 && (!shot))
            {
                fmod_event_one_shot_3d("event:/sfx/pep/punch", x, y)
                fmod_event_one_shot_3d("event:/sfx/enemies/killingblow", x, y)
                GamepadSetVibration((object_index == obj_player1 ? 0 : 1), 0.8, 0.65)
                shot = 1
                movespeed = ((-xscale) * 8)
                hsp = movespeed
                tauntstoredstate = (121 << 0)
                with (baddiegrabbedID)
                {
                    image_xscale = (-other.xscale)
                    pizzahead_subhp = 0
                    hitX = x
                    hitY = y
                    hithsp = ((-other.xscale) * 25)
                    hitvsp = -5
                    linethrown = 1
                    mach2 = 0
                    state = (137 << 0)
                    if other.pizzahead
                        hitLag = 15
                    else
                        hitLag = 5
                    with (instance_create(midpointX, midpointY, obj_explosioneffect))
                    {
                        sprite_index = spr_bombexplosion
                        image_index = 8
                    }
                    repeat (2)
                    {
                        with (create_debris(x, y, 1531))
                        {
                            vsp = (-(irandom_range(8, 11)))
                            hsp = (-(irandom_range(-11, 11)))
                        }
                    }
                    repeat (2)
                    {
                        with (create_debris(x, y, 1525))
                        {
                            vsp = (-(irandom_range(8, 11)))
                            hsp = (-(irandom_range(-11, 11)))
                        }
                    }
                }
                repeat (4 + irandom(6))
                {
                    var spd = (5 + irandom(6))
                    with (create_blur_afterimage(x, y, sprite_index, (image_index - 1), xscale))
                    {
                        hsp = choose((-spd), spd)
                        vsp = choose((-spd), spd)
                        playerid = other.id
                    }
                }
            }
            if (floor(image_index) == (image_number - 1))
            {
                if (sprite_index == spr_player_lungehit)
                    image_index = (image_number - 3)
                else
                    image_index = (image_number - 1)
            }
            hsp = movespeed
            if (grounded && vsp > 0)
            {
                movespeed = Approach(movespeed, 0, 0.2)
                if (movespeed == 0)
                {
                    state = (0 << 0)
                    landAnim = 0
                    camzoom = 1
                }
            }
            break
    }

    camera_set_view_size(view_camera[0], (obj_screensizer.actual_width * camzoom), (obj_screensizer.actual_height * camzoom))
    obj_screensizer.camzoom = camzoom
}

