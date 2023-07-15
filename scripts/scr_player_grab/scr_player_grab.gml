function scr_player_grab() //scr_player_grab
{
    grav = 0.5
    move = (key_left + key_right)
    if grounded
    {
        angle = 0
        if (dir != xscale)
        {
            dir = xscale
            movespeed = 2
            facehurt = 0
        }
        jumpstop = 0
        anger = 100
        if (!(place_meeting(x, (y + 1), obj_railparent)))
        {
            if (sprite_index != spr_swingding)
                hsp = (move * movespeed)
            else
                hsp = (xscale * movespeed)
        }
        else
        {
            var _railinst = instance_place(x, (y + 1), obj_railparent)
            hsp = ((move * movespeed) + (_railinst.movespeed * _railinst.dir))
        }
        if (heavy == 0)
        {
            if (sprite_index != spr_swingding)
            {
                if (move != 0)
                {
                    if (movespeed < 8)
                        movespeed += 0.5
                    else if (floor(movespeed) == 8)
                        movespeed = 6
                }
                else
                    movespeed = 0
                if (movespeed > 6)
                    movespeed -= 0.1
            }
        }
        else
        {
            if (move != 0)
            {
                if (movespeed < 2)
                    movespeed += 0.25
                else if (floor(movespeed) == 2)
                    movespeed = 2
            }
            else
                movespeed = 0
            if (movespeed > 2)
                movespeed -= 1
        }
        if (move != 0 && sprite_index != spr_swingding)
            xscale = move
        if (move != 0)
        {
            if (sprite_index != spr_swingding)
            {
                if (movespeed < 3 && move != 0)
                    image_speed = 0.35
                else if (movespeed > 3 && movespeed < 6)
                    image_speed = 0.45
                else
                    image_speed = 0.6
            }
            else if (heavy == 1)
                image_speed = 0.1
            else
                image_speed = 0.35
        }
    }
    if (sprite_index != spr_swingding)
    {
        if (!grounded)
        {
            if (dir != xscale && sprite_index != spr_swingding)
            {
                dir = xscale
                movespeed = 2
                facehurt = 0
            }
            if (move != 0 && move != xscale && sprite_index != spr_swingding)
                movespeed = 2
            if (momemtum == 0)
                hsp = (move * movespeed)
            else
                hsp = (xscale * movespeed)
            if (move != 0 && move != xscale && momemtum == 1 && movespeed != 0)
                movespeed -= 0.05
            if (movespeed == 0)
                momemtum = 0
            if (move != 0 && movespeed < 6)
                movespeed += 0.5
            if (movespeed > 6)
                movespeed -= 0.5
            if ((scr_solid((x + 1), y) && move == 1) || (scr_solid((x - 1), y) && move == -1))
                movespeed = 0
        }
        if (dir != xscale)
        {
            dir = xscale
            movespeed = 2
            facehurt = 0
        }
        if (move == (-xscale))
        {
            mach2 = 0
            momemtum = 0
        }
        landAnim = 1
        if ((!key_jump2) && jumpstop == 0 && vsp < 0.5 && stompAnim == 0)
        {
            vsp /= 20
            jumpstop = 1
        }
        if (ladderbuffer > 0)
            ladderbuffer--
        if (scr_solid(x, (y - 1)) && jumpstop == 0 && jumpAnim == 1)
        {
            vsp = grav
            jumpstop = 1
        }
        if (move != 0 && sprite_index != spr_swingding)
            xscale = move
    }
    else
    {
        swingdingendcooldown++
        if (swingdingbuffer < 150)
        {
            if grounded
                movespeed = Approach(movespeed, 0, 0.25)
            if (movespeed <= 0)
                sprite_index = spr_haulingidle
            hsp = (xscale * movespeed)
        }
        else if (move != 0)
        {
            if grounded
                movespeed = Approach(movespeed, 2, 0.2)
            if (xscale == 1)
                hsp = ((xscale * movespeed) * move)
            else
                hsp = (-(((xscale * movespeed) * move)))
        }
        else
        {
            if grounded
                movespeed = Approach(movespeed, 0, 0.2)
            hsp = (xscale * movespeed)
        }
        if (floor(image_index) == 0 && spinsndbuffer == 0)
        {
            fmod_event_one_shot_3d("event:/sfx/pep/spin", x, y)
            spinsndbuffer = 5
        }
        else if (spinsndbuffer > 0)
            spinsndbuffer--
        if (floor(image_index) == 0)
            spinsndbuffer = 5
        if (scr_solid((x + xscale), y) && ((!(place_meeting((x + sign(hsp)), y, obj_slope))) || scr_solid_slope((x + sign(hsp)), y)) && (!(place_meeting((x + sign(hsp)), y, obj_destructibles))))
            swingdingthrow = 1
        with (instance_place((x + xscale), y, obj_destructibles))
            instance_destroy()
    }
    if (movespeed == 2 && sprite_index == spr_swingding && swingdingbuffer < 150)
        sprite_index = spr_haulingidle
    if (can_jump && input_buffer_jump > 0 && (!key_down) && (!key_attack) && vsp > 0 && sprite_index != spr_swingding)
    {
        input_buffer_jump = 0
        scr_fmod_soundeffect(jumpsnd, x, y)
        sprite_index = spr_haulingjump
        instance_create(x, y, obj_highjumpcloud2)
        if (heavy == 0)
            vsp = -11
        else
            vsp = -6
        image_index = 0
    }
    if (grounded && move != 0 && sprite_index == spr_haulingidle)
        sprite_index = spr_haulingwalk
    else if (grounded && move == 0 && sprite_index == spr_haulingwalk)
        sprite_index = spr_haulingidle
    if (sprite_index == spr_haulingstart && floor(image_index) == (image_number - 1))
        sprite_index = spr_haulingidle
    if ((sprite_index == spr_haulingjump && floor(image_index) == (image_number - 1)) || ((!grounded) && (sprite_index == spr_haulingwalk || sprite_index == spr_haulingidle)))
        sprite_index = spr_haulingfall
    if (grounded && vsp > 0 && (sprite_index == spr_haulingfall || sprite_index == spr_haulingjump))
        sprite_index = spr_haulingland
    if (sprite_index == spr_haulingland && floor(image_index) == (image_number - 1))
        sprite_index = spr_haulingidle
    if (move != 0 && move != lastmove && swingdingbuffer < 300)
    {
        lastmove = move
        swingdingbuffer += 50
    }
    if (swingdingbuffer > 0)
        swingdingbuffer -= 2
    if (swingdingbuffer >= 300 && sprite_index != spr_swingding)
    {
        sprite_index = spr_swingding
        flash = 1
    }
    if (sprite_index != spr_swingding)
    {
        if key_shoot2
        {
            input_buffer_slap = 0
            if (move != 0)
                move = xscale
            hsp = (xscale * movespeed)
            movespeed = hsp
            image_index = 0
            sprite_index = spr_grab
            state = (74 << 0)
        }
        else if key_attack
        {
            input_buffer_slap = 0
            if (move != 0)
                move = xscale
            hsp = (xscale * movespeed)
            if (movespeed < 9)
                movespeed = 9
            sprite_index = spr_charge
            image_index = 0
            state = (20 << 0)
        }
        if (input_buffer_slap > 0)
        {
            input_buffer_slap = 0
            if (move != 0)
                move = xscale
            hsp = (xscale * movespeed)
            movespeed = hsp
            state = (6 << 0)
            if key_up
                sprite_index = spr_uppercutfinishingblow
            else
                sprite_index = choose(spr_finishingblow1, spr_finishingblow2, spr_finishingblow3, spr_finishingblow4, spr_finishingblow5)
            image_index = 0
        }
    }
    else if ((input_buffer_slap > 0 && swingdingendcooldown > 20) || swingdingthrow)
    {
        if fmod_event_instance_is_playing("event:/sfx/pep/spin")
            fmod_event_instance_stop("event:/sfx/pep/spin", 1)
        input_buffer_slap = 0
        if (move != 0)
            xscale = move
        hsp = (xscale * movespeed)
        swingdingendcooldown = 0
        swingdingthrow = 0
        state = (6 << 0)
        sprite_index = spr_swingdingend
        image_index = 0
    }
    if ((scr_check_groundpound2() || key_jump) && (!grounded))
    {
        sprite_index = spr_piledriver
        dir = xscale
        vsp = -5
        state = (76 << 0)
        image_index = 0
        image_speed = 0.35
    }
    if ((!instance_exists(obj_cloudeffect)) && grounded && move != 0 && (floor(image_index) == 4 || floor(image_index) == 10))
        instance_create(x, (y + 43), obj_cloudeffect)
    if (key_down && grounded && sprite_index != spr_swingding && sprite_index != spr_swingdingend)
    {
        state = (100 << 0)
        landAnim = 0
        crouchAnim = 1
        image_index = 0
        idle = 0
    }
    if (move != 0 && (floor(image_index) == 3 || floor(image_index) == 8) && steppy == 0)
        steppy = 1
    if (move != 0 && floor(image_index) != 3 && floor(image_index) != 8)
        steppy = 0
    if (sprite_index != spr_swingding)
        image_speed = 0.35
    else if (heavy == 1)
        image_speed = 0.1
    else
        image_speed = 0.5
    if (!instance_exists(baddiegrabbedID))
    {
        state = (0 << 0)
        landAnim = 0
        image_index = 0
    }
}

