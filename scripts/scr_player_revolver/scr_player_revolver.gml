function scr_player_revolver() //scr_player_revolver
{
    landAnim = 0
    hsp = (xscale * movespeed)
    if grounded
    {
        if (movespeed > 0)
            movespeed -= 0.2
    }
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_playerV_revolverstart)
        sprite_index = spr_playerV_revolverhold
    if ((sprite_index == spr_playerV_revolverhold || sprite_index == spr_playerV_airrevolverstart || sprite_index == spr_playerV_revolverstart) && (!key_slap))
    {
        if grounded
            sprite_index = spr_playerV_revolvershoot
        else
            sprite_index = spr_playerV_airrevolver
        image_index = 0
        with (instance_create((x + (xscale * 20)), (y + 20), obj_shotgunbullet))
        {
            is_solid = 0
            sprite_index = spr_cheesebullet
            image_xscale = other.xscale
            spd = 16
        }
        fmod_event_one_shot_3d("event:/sfx/enemies/kill", x, y)
    }
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_playerV_revolvershoot)
    {
        image_index = 0
        state = (0 << 0)
        sprite_index = spr_playerV_revolverend
        movespeed = 2
    }
    if ((sprite_index == spr_playerV_airrevolverend || sprite_index == spr_playerV_airrevolver || sprite_index == spr_playerV_airrevolverstart) && grounded)
    {
        if (key_attack && movespeed >= 6)
            state = (104 << 0)
        else
            state = (0 << 0)
    }
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_playerV_airrevolver)
    {
        if (key_attack && movespeed >= 6)
            state = (104 << 0)
        else
        {
            image_index = 0
            state = (0 << 0)
        }
    }
    if key_down
    {
        if grounded
        {
            with (instance_create(x, y, obj_jumpdust))
                image_xscale = other.xscale
            movespeed = 12
            crouchslipbuffer = 25
            grav = 0.5
            sprite_index = spr_crouchslip
            image_index = 0
            machhitAnim = 0
            state = (5 << 0)
            fmod_event_instance_play(snd_crouchslide)
        }
        else
        {
            particle_set_scale((5 << 0), xscale, 1)
            create_particle(x, y, (5 << 0), 0)
            flash = 0
            state = (5 << 0)
            vsp = 10
            image_index = 0
            sprite_index = spr_dive
        }
    }
    image_speed = 0.4
}

