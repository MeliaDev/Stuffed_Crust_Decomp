function state_player_throwing() //state_player_throwing
{
    hsp = 0
    jumpAnim = 1
    dashAnim = 1
    landAnim = 0
    machslideAnim = 1
    moveAnim = 1
    stopAnim = 1
    crouchslideAnim = 1
    crouchAnim = 1
    move = (key_left + key_right)
    if key_attack
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
    if (!key_shoot)
    {
        if key_slap
        {
            image_index = 0
            sprite_index = spr_haulingstart
            state = (79 << 0)
        }
        if (key_jump && throwforce >= 10)
        {
            image_index = 0
            sprite_index = spr_slam
            slamming = 0
            if (throwforce >= 40)
                vsp = -13
            else
                vsp = -9
            state = (75 << 0)
        }
        if (sprite_index == spr_punchprep)
        {
            image_index = 0
            sprite_index = spr_realpunch
            input_buffer_slap = 0
            if (move != 0)
                move = xscale
            hsp = (xscale * movespeed)
            movespeed = hsp
            state = (154 << 0)
        }
        if (sprite_index == spr_backkickprep)
        {
            image_index = 0
            sprite_index = spr_backkick
            if (movespeed < 8)
                movespeed = 8
            if (global.shootkeyattack > 0)
                movespeed += (throwforce / 4)
            state = (81 << 0)
        }
        if (sprite_index == spr_uppunchprep)
        {
            image_index = 0
            sprite_index = spr_uppunch
            state = (82 << 0)
        }
        if (sprite_index == spr_shoulderprep)
        {
            image_index = 0
            sprite_index = spr_shoulder
            state = (83 << 0)
            if (throwforce >= 40)
            {
                with (obj_camera)
                {
                    shake_mag = 10
                    shake_mag_acc = (30 / room_speed)
                }
            }
        }
        if (sprite_index == spr_slam || sprite_index == spr_punchprep || sprite_index == spr_backkickprep || sprite_index == spr_uppunchprep || sprite_index == spr_shoulderprep || sprite_index == spr_shoulder || sprite_index == spr_uppunch || sprite_index == spr_backkick || sprite_index == spr_realpunch)
        {
            if (sprite_index != spr_realpunch && sprite_index != spr_punchprep && sprite_index != spr_slam)
                fmod_event_one_shot_3d("event:/sfx/pep/punch", x, y)
            return;
        }
    }
    if (throwforce >= 40)
        image_speed = 0.35
    if (key_shoot || key_shoot2)
    {
        if (key_jump && throwforce >= 10)
        {
            image_index = 0
            sprite_index = spr_slam
            slamming = 0
            if (throwforce >= 40)
                vsp = -13
            else
                vsp = -9
            state = (75 << 0)
        }
        if (sprite_index == spr_slam)
            return;
        if (throwforce < 40)
            throwforce++
        if ((xscale == 1 && move == 1) || (xscale == -1 && move == -1))
            sprite_index = spr_punchprep
        else if ((xscale == 1 && move == -1) || (xscale == -1 && move == 1))
            sprite_index = spr_backkickprep
        else if key_up
            sprite_index = spr_uppunchprep
        else if key_down
            sprite_index = spr_shoulderprep
        else
            sprite_index = spr_grab
    }
    else
    {
        throwforce = Approach(throwforce, 0, 0.5)
        move = (key_left + key_right)
        hsp = (move * movespeed)
        if ((!key_jump2) && jumpstop == 0 && vsp < 0.5 && stompAnim == 0)
        {
            vsp /= 2
            jumpstop = 1
        }
        if (grounded && vsp > 0)
            jumpstop = 0
        if (((scr_solid((x + 1), y) && xscale == 1) || (scr_solid((x - 1), y) && xscale == -1)) && (!(scr_solid((x + sign(hsp)), y))))
            movespeed = 0
        if (xscale == (move * -1))
            movespeed = 0
        if (key_jump && (!grounded))
        {
            image_index = 0
            sprite_index = spr_slam
            slamming = 0
            if (throwforce >= 40)
                vsp = -13
            else
                vsp = -9
            state = (75 << 0)
        }
        if (move == 0 && grounded)
        {
            movespeed = 0
            sprite_index = spr_grabbing
        }
        if (move != 0)
        {
            if grounded
                sprite_index = spr_grabbingmove
            xscale = move
        }
        if (key_jump && grounded && (!key_down) && (!key_attack))
        {
            vsp = -9
            image_index = 0
            sprite_index = spr_grabbingjump
        }
        if (sprite_index == spr_grabbingjump && floor(image_index) == (image_number - 1))
            sprite_index = spr_grabbingfall
        if ((!grounded) && vsp > 0)
            sprite_index = spr_grabbingfall
        if (move != 0)
        {
            if (movespeed < 6)
                movespeed += 0.5
            else if (movespeed == 6)
                movespeed = 6
        }
        else
            movespeed = 0
        if (move != 0 && grounded)
        {
            if (movespeed < 3 && move != 0)
                image_speed = 0.35
            else if (movespeed > 3 && movespeed < 6)
                image_speed = 0.45
            else
                image_speed = 0.6
        }
        else
            image_speed = 0.35
        if ((!instance_exists(obj_cloudeffect)) && grounded && move != 0 && floor(image_index) == (image_number - 1))
            instance_create(x, (y + 43), obj_cloudeffect)
        if (grounded && vsp > 1)
            instance_create(x, y, obj_landcloud)
    }
}

