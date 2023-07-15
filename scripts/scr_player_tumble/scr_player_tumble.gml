function scr_player_tumble() //scr_player_tumble
{
    if place_meeting(x, (y + 1), obj_railparent)
    {
        var _railinst = instance_place(x, (y + 1), obj_railparent)
        railmovespeed = _railinst.movespeed
        raildir = _railinst.dir
    }
    hsp = ((xscale * movespeed) + (railmovespeed * raildir))
    move = (key_right + key_left)
    mask_index = spr_crouchmask
    if (sprite_index == spr_tumblestart)
        movespeed = 6
    if (sprite_index == spr_playerV_divekickstart && floor(image_index) == (image_number - 1))
        sprite_index = spr_machroll
    if skateboarding
        sprite_index = spr_clowncrouch
    if (((key_down2 && (sprite_index == spr_rollmach || sprite_index == spr_machroll || sprite_index == spr_backslideland || sprite_index == spr_playerV_divekickstart || sprite_index == spr_playerV_divekick)) || (key_down && (sprite_index == spr_crouchslip || sprite_index == spr_backslide || sprite_index == spr_playerV_divekickstart || sprite_index == spr_playerV_divekick || (sprite_index == spr_mach2jump && vsp > 0)))) && (!grounded))
    {
        vsp = 10
        sprite_index = spr_dive
        fmod_event_instance_play(snd_dive)
    }
    if (sprite_index == spr_tumble && grounded && (!key_down))
    {
        if (move == xscale)
            movespeed = Approach(movespeed, 12, 0.25)
        else if (move == (-xscale))
            movespeed = Approach(movespeed, 8, 0.25)
        else
            movespeed = Approach(movespeed, 10, 0.25)
    }
    if (grounded && sprite_index == spr_dive)
    {
        image_index = 0
        if (dropdash == 0)
            sprite_index = spr_rollmach
        else
            sprite_index = spr_snick_dropdash
    }
    if (sprite_index == spr_dive && key_jump)
    {
        sprite_index = spr_poundcancel1
        image_index = 0
        state = (108 << 0)
        dir = xscale
        vsp = -6
    }
    if (movespeed <= 2 && sprite_index != spr_tumble && sprite_index != spr_player_breakdance)
    {
        if (scr_slope() && (key_down || character == "S") && slopedirection == 0)
        {
            xscale *= -1
            slopedirection = 1
        }
        else
            state = (0 << 0)
    }
    else
        slopedirection = 0
    if ((!scr_slope()) && sprite_index == spr_tumblestart && floor(image_index) < 11)
        image_index = 11
    if (sprite_index == spr_mach2jump)
    {
        if (punch_afterimage > 0)
            punch_afterimage--
        else
        {
            punch_afterimage = 5
            with (create_mach3effect(x, y, sprite_index, image_index, 1))
            {
                image_xscale = other.xscale
                playerid = other.id
            }
        }
        if (grounded && dropdash == 0)
        {
            image_index = 0
            sprite_index = spr_rollmach
            if (character == "V")
                sprite_index = spr_playerV_divekickstart
        }
    }
    if ((!isgustavo) && character != "V" && sprite_index != spr_snick_spindash && sprite_index != spr_tumble && sprite_index != spr_tumblestart && sprite_index != spr_tumbleend && can_jump && input_buffer_jump > 0 && (!(scr_solid((x + 27), (y - 32)))) && (!(scr_solid((x - 27), (y - 32)))) && (!(scr_solid(x, (y - 32)))) && (!(scr_solid(x, (y - 16)))))
    {
        scr_fmod_soundeffect(jumpsnd, x, y)
        input_buffer_jump = 0
        if (sprite_index == spr_crouchslip)
            sprite_index = spr_jumpdive1
        else
            sprite_index = spr_mach2jump
        image_index = 0
        vsp = -11
        with (instance_create(x, y, obj_superdashcloud))
        {
            image_xscale = other.xscale
            other.dashcloudid = id
        }
    }
    if (grounded && (sprite_index == spr_jumpdive1 || sprite_index == spr_jumpdive2) && vsp > 0)
    {
        sprite_index = spr_crouchslip
        jumpstop = 0
    }
    if (sprite_index == spr_jumpdive1 && floor(image_index) == (image_number - 1))
        sprite_index = spr_jumpdive2
    if (sprite_index == spr_crouchslip && (!grounded))
        sprite_index = spr_jumpdive2
    if (sprite_index == spr_player_Sjumpcancelland && floor(image_index) == (image_number - 1))
        sprite_index = spr_player_Sjumpcancelslide
    if (sprite_index == spr_jumpdive2 && grounded)
        sprite_index = spr_crouchslip
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_rollmach && movespeed > 12)
    {
        sprite_index = spr_backslideland
        image_index = 0
    }
    if (sprite_index == spr_rollmach && (!grounded))
        sprite_index = spr_mach2jump
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_backslideland)
        sprite_index = spr_backslide
    if (sprite_index == spr_player_Sjumpcancel && grounded)
        sprite_index = spr_player_Sjumpcancelland
    if (sprite_index == spr_playerN_jetpackboost && grounded)
        sprite_index = spr_playerN_jetpackslide
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_breakdance)
    {
        particle_set_scale((5 << 0), xscale, 1)
        create_particle(x, y, (5 << 0), 0)
        movespeed = 12
        sprite_index = spr_breakdancesuper
    }
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_noise_vulnerable2)
    {
        particle_set_scale((5 << 0), xscale, 1)
        create_particle(x, y, (5 << 0), 0)
        movespeed = 12
        sprite_index = spr_breakdancesuper
    }
    if (sprite_index == spr_tumblestart && floor(image_index) == (image_number - 1))
    {
        sprite_index = spr_tumble
        movespeed = 14
    }
    if ((state != (108 << 0) && (place_meeting((x + xscale), y, obj_solid) || scr_solid_slope((x + xscale), y)) && (!(place_meeting((x + hsp), y, obj_rollblock))) && ((!(place_meeting((x + hsp), y, obj_rattumble))) || sprite_index != spr_tumble) && (!(place_meeting((x + hsp), y, obj_destructibles)))) || place_meeting(x, y, obj_timedgate))
    {
        hsp = 0
        movespeed = 0
        if (sprite_index == spr_tumble || sprite_index == spr_tumblestart)
        {
            fmod_event_one_shot_3d("event:/sfx/pep/bumpwall", x, y)
            state = (106 << 0)
            landAnim = 0
            sprite_index = spr_tumbleend
            image_index = 0
            hsp = ((-xscale) * 2)
            vsp = -3
            jumpstop = 1
        }
        else
        {
            fmod_event_one_shot_3d("event:/sfx/pep/splat", x, y)
            state = (106 << 0)
            image_index = 0
            sprite_index = spr_wallsplat
        }
    }
    if ((!key_jump2) && jumpstop == 0 && vsp < 0.5 && stompAnim == 0)
    {
        vsp /= 2
        jumpstop = 1
    }
    if (grounded && vsp > 0 && (!(place_meeting(x, y, obj_bigcheese))))
        jumpstop = 0
    if (input_buffer_jump > 0 && can_jump && state != (106 << 0) && hsp != 0 && sprite_index == spr_tumble && (!(place_meeting(x, y, obj_pinballlauncher))) && (!(place_meeting(x, y, obj_bigcheese))))
    {
        if (!(scr_solid(x, (y - 16))))
        {
            with (instance_create(x, y, obj_highjumpcloud2))
                image_xscale = other.xscale
            vsp = -11
            image_index = 0
        }
    }
    if (crouchslipbuffer > 0)
        crouchslipbuffer--
    if (character == "S")
    {
        if (grounded && sprite_index != spr_tumble)
        {
            if (key_attack || key_down)
                movespeed = Approach(movespeed, 0, 0.15)
            else
                movespeed = Approach(movespeed, 0, 0.25)
        }
        if key_slap
        {
            dropdash = 0
            spindashcharge = 0
            if (key_attack && movespeed >= 10)
            {
                fmod_event_one_shot_3d("event:/sfx/pep/suplexdash", x, y)
                sprite_index = spr_snick_mach3
                state = (121 << 0)
            }
            else
            {
                crouchAnim = 1
                state = (0 << 0)
                movespeed = 0
            }
        }
    }
    if ((!key_down) && key_attack && dropdash == 0 && grounded && state != (106 << 0) && sprite_index != spr_tumblestart && sprite_index != spr_tumble && sprite_index != spr_tumbleend && (!(scr_solid(x, (y - 16)))) && (!(scr_solid(x, (y - 32)))) && sprite_index != spr_snick_dropdash && sprite_index != spr_player_breakdance && sprite_index != spr_noise_vulnerable2)
    {
        spindashcharge = 0
        if (crouchslipbuffer == 0)
        {
            with (instance_create(x, y, obj_jumpdust))
                image_xscale = other.xscale
            if (movespeed >= 12)
            {
                sprite_index = spr_rollgetup
                state = (121 << 0)
            }
            else
            {
                if (character == "P" && ispeppino)
                    sprite_index = spr_player_machhit
                else
                    sprite_index = spr_rollgetup
                state = (104 << 0)
            }
            image_index = 0
            fmod_event_instance_play(rollgetupsnd)
        }
    }
    if (scr_slope() && hsp != 0 && movespeed < 28 && (key_down || character == "S"))
        scr_player_addslopemomentum(0.25, 0.5)
    var cancelslide = ((sprite_index != spr_player_Sjumpcancelland || sprite_index != spr_player_Sjumpcancelslide) ? (key_down && key_attack) : key_down)
    if ((!key_down) && (!key_attack) && spindashcharge == 0 && grounded && dropdash == 0 && vsp > 0 && state != (106 << 0) && sprite_index != spr_tumblestart && sprite_index != spr_tumble && sprite_index != spr_tumbleend && (!(scr_solid(x, (y - 16)))) && (!(scr_solid(x, (y - 32)))) && sprite_index != spr_player_breakdance && sprite_index != spr_noise_vulnerable2)
    {
        if (crouchslipbuffer == 0)
        {
            if (movespeed > 6)
            {
                state = (105 << 0)
                sprite_index = spr_machslidestart
                image_index = 0
            }
            else
                state = (0 << 0)
        }
    }
    if (sprite_index == spr_crouchslip || sprite_index == spr_breakdancesuper || sprite_index == spr_machroll || sprite_index == spr_tumble || sprite_index == spr_tumblestart || sprite_index == spr_rollmach || sprite_index == spr_mach2jump)
        image_speed = (abs(movespeed) / 15)
    else if (floor(image_index) == (image_number - 1) && sprite_index == spr_mach2jump)
        image_speed = 0
    else if ((floor(image_index) == (image_number - 1) && sprite_index == spr_player_Sjumpcancel) || sprite_index == spr_playerN_jetpackstart)
        image_speed = 0
    else
        image_speed = 0.35
    if ((!instance_exists(dashcloudid)) && grounded)
    {
        with (instance_create(x, y, obj_dashcloud))
        {
            image_xscale = other.xscale
            other.dashcloudid = id
        }
    }
}

