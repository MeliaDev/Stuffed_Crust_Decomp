function scr_player_shoulderbash() //scr_player_shoulderbash
{
    move = (key_left + key_right)
    movespeed = (sprite_index == spr_pepperman_shoulderstart ? shoulderbash_mspeed_start : Approach(movespeed, (shoulderbash_mspeed_loop + move), 0.5))
    hsp = ((xscale * movespeed) + (railmovespeed * raildir))
    if (!instance_exists(chargeeffectid))
    {
        with (instance_create((x + 5), (y - 5), obj_chargeeffect))
        {
            playerid = other.object_index
            other.chargeeffectid = id
            depth = (other.depth - 1)
        }
    }
    if (sprite_index == spr_player_attackdash)
    {
        image_speed = 0.45
        if (key_down && (!skateboarding) && (!(place_meeting(x, y, obj_dashpad))))
        {
            particle_set_scale((5 << 0), xscale, 1)
            create_particle(x, y, (5 << 0), 0)
            flash = 0
            state = (5 << 0)
            vsp = 10
            image_index = 0
            if (!grounded)
                sprite_index = spr_mach2jump
            else
            {
                sprite_index = spr_rollmach
                if (character == "V")
                    sprite_index = spr_playerV_divekickstart
            }
        }
        if key_shoot
        {
            if (punch_afterimage > 0)
                punch_afterimage--
            else
            {
                punch_afterimage = 5
                if (global.blueeffects > 0 && global.blueeffects < 4)
                {
                    if (global.blueeffects == 1)
                    {
                        with (create_firemouth_afterimage(x, y, sprite_index, image_index, 1))
                        {
                            image_xscale = other.xscale
                            playerid = other.id
                        }
                    }
                    if (global.blueeffects == 2)
                    {
                        with (create_blue_afterimage(x, y, sprite_index, image_index, 1))
                        {
                            image_xscale = other.xscale
                            playerid = other.id
                        }
                    }
                    if (global.blueeffects == 3)
                    {
                        with (create_red_afterimage(x, y, sprite_index, image_index, 1))
                        {
                            image_xscale = other.xscale
                            playerid = other.id
                        }
                    }
                }
                else
                {
                    with (create_mach3effect(x, y, sprite_index, image_index, 1))
                    {
                        image_xscale = other.xscale
                        playerid = other.id
                    }
                }
            }
            if (floor(image_index) == (image_number - 2))
                image_index = 3
        }
        else
        {
            image_index = 0
            if grounded
            {
                if key_attack
                {
                    state = (105 << 0)
                    fmod_event_one_shot_3d("event:/sfx/pep/break", x, y)
                    sprite_index = spr_machslidestart
                }
                else
                {
                    state = (0 << 0)
                    sprite_index = spr_idle
                }
            }
            else
            {
                state = (92 << 0)
                if (character == "P")
                    hasjumped = 1
                sprite_index = spr_fall
            }
        }
    }
    if (sprite_index == spr_pepperman_shoulderstart && floor(image_index) == (image_number - 1))
        sprite_index = spr_pepperman_shoulderloop
    if (sprite_index == spr_pepperman_shoulderloop && (!key_attack))
    {
        state = (0 << 0)
        image_index = 0
    }
    if grounded
        jumpstop = 0
    if ((!key_jump2) && jumpstop == 0 && vsp < 0.5)
    {
        vsp /= 20
        jumpstop = 1
    }
    if (input_buffer_jump > 0 && can_jump)
    {
        input_buffer_jump = 0
        vsp = (-shoulderbash_jumpspeed)
        scr_fmod_soundeffect(jumpsnd, x, y)
    }
    if ((!instance_exists(dashcloudid)) && grounded)
    {
        with (instance_create(x, (y - 5), obj_dashcloud))
        {
            image_xscale = other.xscale
            other.dashcloudid = id
        }
    }
    if place_meeting((x + xscale), y, obj_solid)
    {
        fmod_event_one_shot_3d("event:/sfx/pep/splat", x, y)
        state = (106 << 0)
        image_index = 0
        sprite_index = spr_wallsplat
    }
}

