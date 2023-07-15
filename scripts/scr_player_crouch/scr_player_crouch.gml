function scr_player_crouch() //scr_player_crouch
{
    if (sprite_index != spr_snick_spindash)
        move = (key_left + key_right)
    if (!(place_meeting(x, (y + 1), obj_railparent)))
        hsp = (move * movespeed)
    else
    {
        var _railinst = instance_place(x, (y + 1), obj_railparent)
        hsp = ((move * movespeed) + (_railinst.movespeed * _railinst.dir))
    }
    movespeed = 4
    mask_index = spr_crouchmask
    turning = 0
    if ((!grounded) && (!key_jump))
    {
        jumpAnim = 0
        state = (101 << 0)
        movespeed = 4
        crouchAnim = 1
        image_index = 0
    }
    if (grounded && (!key_down) && spindashcharge == 0 && (!(scr_solid(x, (y - 16)))) && (!(scr_solid(x, (y - 32)))) && (!key_jump))
    {
        state = (0 << 0)
        movespeed = 0
        crouchAnim = 1
        jumpAnim = 1
        image_index = 0
        mask_index = spr_player_mask
    }
    if (crouchAnim == 0)
    {
        if (move == 0)
        {
            if (shotgunAnim == 0)
            {
                if (character == "S" && spindashcharge > 0)
                    sprite_index = spr_snick_spindash
                else
                    sprite_index = spr_crouch
            }
            else
                sprite_index = spr_shotgunduck
        }
        if (move != 0)
        {
            if (shotgunAnim == 0)
                sprite_index = spr_crawl
            else
                sprite_index = spr_shotguncrawl
        }
    }
    if (crouchAnim == 1)
    {
        if (move == 0)
        {
            if (shotgunAnim == 0)
                sprite_index = spr_couchstart
            else
                sprite_index = spr_shotgungoduck
            if (floor(image_index) == (image_number - 1))
                crouchAnim = 0
        }
    }
    if (move != 0)
    {
        xscale = move
        crouchAnim = 0
    }
    if skateboarding
        sprite_index = spr_clowncrouch
    if (key_jump && grounded && (!(scr_solid(x, (y - 16)))) && (!(scr_solid(x, (y - 32)))))
    {
        scr_fmod_soundeffect(jumpsnd, x, y)
        vsp = -8
        state = (101 << 0)
        movespeed = 4
        image_index = 0
        crouchAnim = 1
        jumpAnim = 1
    }
    if (character == "S")
    {
        if (input_buffer_slap > 0 && key_down)
        {
            input_buffer_slap = 0
            if (spindashcharge < 6)
            {
                if (flash == 0)
                {
                    flash = 1
                    fmod_event_one_shot_3d("event:/sfx/enemies/batwing", x, y)
                }
                spindashcharge += 1
            }
            else
                spindashcharge = 6
            if (!instance_exists(dashcloudid))
            {
                with (instance_create((x - (66 * xscale)), y, obj_superdashcloud))
                {
                    image_xscale = other.xscale
                    other.dashcloudid = id
                }
            }
        }
        if ((!key_down) && spindashcharge > 0)
        {
            particle_set_scale((5 << 0), xscale, 1)
            create_particle(x, y, (5 << 0), 0)
            flash = 0
            state = (5 << 0)
            image_index = 0
            vsp = 0
            movespeed = (14 + (spindashcharge * 2))
            spindashcharge = 1
            sprite_index = spr_machroll
        }
    }
    if (key_slap2 && character == "V")
    {
        if (move == 0)
            movespeed = 0
        state = (1 << 0)
        image_index = 0
        sprite_index = spr_playerV_revolverstart
    }
    image_speed = 0.45
}

