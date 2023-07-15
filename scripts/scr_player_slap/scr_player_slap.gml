function scr_player_slap() //scr_player_slap
{
    if (!grounded)
    {
        fallinganimation++
        if (fallinganimation >= 60)
        {
            sprite_index = spr_player_facestomp
            state = (92 << 0)
        }
    }
    move = (key_left + key_right)
    if (sprite_index != spr_player_slapdash)
    {
        if (movespeed > 6)
            movespeed -= 0.25
        else if (move != 0 && movespeed < 5)
            movespeed += 0.25
        else
            movespeed = 6
        if (move == 0)
            movespeed = 0
        if (!(place_meeting(x, (y + 1), obj_railparent)))
            hsp = (move * movespeed)
        else
        {
            var _railinst = instance_place(x, (y + 1), obj_railparent)
            hsp = ((move * movespeed) + (_railinst.movespeed * _railinst.dir))
        }
    }
    else
        hsp = (xscale * movespeed)
    landAnim = 0
    if (slapbuffer < 8)
        slapbuffer++
    if (sprite_index != spr_player_slapup && sprite_index != spr_player_slapdash)
    {
        if key_shoot2
            slapbuffer = 0
        else if (slapbuffer >= 5)
        {
            if (move != 0)
                xscale = move
        }
    }
    else if (sprite_index == spr_player_slapdash)
    {
        if (slapbuffer < 5)
        {
            if (move != 0)
                xscale = move
        }
    }
    if (sprite_index != spr_player_slapup && sprite_index != spr_player_slapdash)
    {
        if (floor(image_index) == (image_number - 1))
        {
            if (slapbuffer < 8)
            {
                if (grounded && move == 0)
                {
                    if (slaphand == 1)
                        sprite_index = spr_player_slap1
                    if (slaphand == -1)
                        sprite_index = spr_player_slap2
                }
                else if (grounded && move != 0)
                {
                    if (slaphand == 1)
                        sprite_index = spr_player_slaprun1
                    if (slaphand == -1)
                        sprite_index = spr_player_slaprun2
                }
                else
                {
                    if (slaphand == 1)
                        sprite_index = spr_player_slap1air
                    if (slaphand == -1)
                        sprite_index = spr_player_slap2air
                }
                image_index = 0
                slaphand *= -1
            }
        }
        else if (grounded && move == 0)
        {
            if (slaphand == 1)
                sprite_index = spr_player_slap1
            if (slaphand == -1)
                sprite_index = spr_player_slap2
        }
        else if (grounded && move != 0)
        {
            if (slaphand == 1)
                sprite_index = spr_player_slaprun1
            if (slaphand == -1)
                sprite_index = spr_player_slaprun2
        }
        else
        {
            if (slaphand == 1)
                sprite_index = spr_player_slap1air
            if (slaphand == -1)
                sprite_index = spr_player_slap2air
        }
    }
    if (sprite_index != spr_player_slapdash && floor(image_index) == 1 && (!instance_exists(obj_slaphitbox2)))
    {
        if (sprite_index == spr_player_slapup)
        {
            with (instance_create(x, y, obj_slaphitbox2))
            {
                sprite_index = spr_player_hitboxslapup
                playerid = other.id
            }
        }
        else
        {
            with (instance_create(x, y, obj_slaphitbox2))
                playerid = other.id
        }
    }
    if (grounded && (key_jump || (input_buffer_jump > 0 && (!key_attack) && vsp > 0)) && (!key_down))
    {
        if (slaphand == 1)
            sprite_index = spr_player_slap1air
        if (slaphand == -1)
            sprite_index = spr_player_slap2air
        input_buffer_jump = 0
        scr_fmod_soundeffect(jumpsnd, x, y)
        vsp = -10
        jumpAnim = 1
        jumpstop = 0
        if (character == "P")
            hasjumped = 1
        freefallstart = 0
    }
    if (floor(image_index) == (image_number - 1) && slapbuffer == 8)
    {
        if (key_shoot && sprite_index != spr_player_slapup && sprite_index != spr_player_slapdash)
        {
            slaphand *= -1
            state = (23 << 0)
        }
        else
        {
            slapbuffer = 0
            if (mach2 >= 35)
                state = (104 << 0)
            else if (mach2 >= 100)
                state = (121 << 0)
            else if grounded
            {
                if (move != 0)
                    dir = move
                state = (0 << 0)
            }
            else if (!grounded)
            {
                if (move != 0)
                    dir = move
                sprite_index = spr_player_fall
                state = (92 << 0)
            }
        }
    }
    if ((!instance_exists(obj_cloudeffect)) && grounded && move != 0 && (floor(image_index) == 4 || floor(image_index) == 10))
        instance_create(x, (y + 43), obj_cloudeffect)
    image_speed = 0.35
}

