function scr_player_mach1() //scr_player_mach1
{
    image_speed = 0.5
    landAnim = 0
    machhitAnim = 0
    crouchslideAnim = 1
    dir = xscale
    move = (key_left + key_right)
    if (scr_solid((x + xscale), y) && ((!(place_meeting((x + xscale), y, obj_slope))) || scr_solid_slope((x + sign(hsp)), y)))
    {
        mach2 = 0
        state = (0 << 0)
        movespeed = 0
    }
    if (!(place_meeting(x, (y + 1), obj_railparent)))
        hsp = (xscale * movespeed)
    else
    {
        var _railinst = instance_place(x, (y + 1), obj_railparent)
        hsp = ((xscale * movespeed) + (_railinst.movespeed * _railinst.dir))
    }
    if (xscale != move && move != 0)
    {
        sprite_index = spr_mach1
        image_index = 0
        momemtum = 0
        mach2 = 0
        movespeed = 6
        xscale = move
    }
    if skateboarding
    {
        if (key_down || (grounded && vsp > 0 && scr_solid(x, (y - 3)) && scr_solid(x, y)) || place_meeting(x, y, obj_solid))
        {
            if (sprite_index != spr_clowncrouch)
            {
                sprite_index = spr_clowncrouch
                crouchAnim = 1
                image_index = 0
                idle = 0
                mask_index = spr_crouchmask
            }
        }
        else if (sprite_index != spr_clown)
        {
            sprite_index = spr_clown
            mask_index = spr_player_mask
        }
    }
    if grounded
    {
        if (movespeed <= 8)
            movespeed += 0.075
        if (movespeed >= 8)
        {
            state = (104 << 0)
            particle_set_scale((5 << 0), xscale, 1)
            create_particle(x, y, (5 << 0), 0)
        }
        if (vsp > 0)
            jumpstop = 0
        if (!instance_exists(dashcloudid))
        {
            with (instance_create(x, y, obj_dashcloud))
            {
                image_xscale = other.xscale
                other.dashcloudid = id
            }
        }
        if (sprite_index != spr_mach1 && vsp > 0)
        {
            sprite_index = spr_mach1
            image_index = 0
        }
        if (input_buffer_jump > 0)
        {
            input_buffer_jump = 0
            sprite_index = spr_airdash1
            image_index = 0
            dir = xscale
            momemtum = 1
            if key_up
            {
                if ispeppino
                    sprite_index = spr_player_Sjumpstart
                else
                {
                    sprite_index = spr_playerN_glide
                    glidemode = 1
                    fmod_event_one_shot_3d("event:/sfx/pep/rampjump", x, y)
                }
            }
            if glidemode
                vsp = -8
            else
                vsp = -11
            jumpAnim = 1
        }
    }
    else if (sprite_index != spr_airdash1)
        sprite_index = spr_airdash2
    if (sprite_index == spr_airdash1 && floor(image_index) == (image_number - 1))
        sprite_index = spr_airdash2
    if (sprite_index == spr_player_Sjumpstart && floor(image_index) == (image_number - 1))
        sprite_index = spr_player_Sjump
    if (sprite_index == spr_player_Sjump && floor(image_index) == (image_number - 1))
        image_index = 0
    if (sprite_index == spr_playerN_glide && floor(image_index) == (image_number - 1))
        image_index = 0
    if (!key_attack)
    {
        state = (0 << 0)
        image_index = 0
    }
    if ((!key_jump2) && (!jumpstop) && vsp < 0.5)
    {
        vsp /= 20
        jumpstop = 1
    }
    if (place_meeting((x + xscale), y, obj_solid) && (!(place_meeting((x + sign(hsp)), y, obj_slope))))
    {
        movespeed = 0
        state = (0 << 0)
    }
    if (character == "V")
    {
        if key_slap2
        {
            sprite_index = spr_playerV_airrevolver
            image_index = 0
            vsp = -5
            state = (1 << 0)
            with (instance_create((x + (xscale * 20)), (y + 20), obj_shotgunbullet))
            {
                is_solid = 0
                image_xscale = other.xscale
            }
        }
    }
    if (scr_check_groundpound() && (!grounded))
    {
        if (!shotgunAnim)
        {
            sprite_index = spr_bodyslamstart
            image_index = 0
            state = (122 << 0)
            vsp = -5
        }
        else
        {
            sprite_index = spr_player_shotgunjump1
            image_index = 0
            state = (122 << 0)
            vsp = -5
            with (instance_create((x + (xscale * 30)), (y + 60), obj_shotgunbullet))
            {
                sprite_index = sprite10391
                spdh = -10
                spd = 0
            }
            with (instance_create((x + (xscale * 30)), (y + 60), obj_shotgunbullet))
            {
                sprite_index = sprite10391
                spdh = -10
                spd = 5
            }
            with (instance_create((x + (xscale * 30)), (y + 60), obj_shotgunbullet))
            {
                sprite_index = sprite10391
                spdh = -10
                spd = -5
            }
        }
    }
    if (grounded && vsp > 0)
    {
        if (machpunchAnim == 1)
        {
            if (global.combo >= 25 || global.panic)
            {
                if ispeppino
                    sprite_index = spr_player_attackdash
                else
                    sprite_index = spr_playerN_dashpad
                if ((sprite_index == spr_player_attackdash || sprite_index == spr_playerN_dashpad) && floor(image_index) == (image_number - 1))
                {
                    sprite_index = spr_mach1
                    image_index = 0
                    machpunchAnim = 0
                }
            }
            else
            {
                if (punch == 0)
                    sprite_index = spr_machpunch1
                if (punch == 1)
                    sprite_index = spr_machpunch2
                if (floor(image_index) == 4 && sprite_index == spr_machpunch1)
                {
                    punch = 1
                    machpunchAnim = 0
                }
                if (floor(image_index) == 4 && sprite_index == spr_machpunch2)
                {
                    punch = 0
                    machpunchAnim = 0
                }
            }
        }
    }
    scr_dotaunt()
}

