function scr_player_faceplant() //scr_player_faceplant
{
    hsp = (xscale * movespeed)
    move = (key_right + key_left)
    if key_slap
        movespeed = Approach(movespeed, 5, 0.05)
    else
        movespeed = Approach(movespeed, 0, 0.075)
    if (!ispeppino)
        vsp = 0
    else
        vsp -= 0.15
    var _cancel = ((!key_attack) || (!key_slap) || move == 0)
    if (place_meeting((x + hsp), y, obj_solid) && (!(place_meeting((x + hsp), y, obj_slope))) && (!(place_meeting((x + hsp), y, obj_destructibles))))
    {
        fmod_event_one_shot_3d("event:/sfx/pep/groundpound", x, y)
        if (!isgustavo)
            sprite_index = spr_hitwall
        else if brick
            sprite_index = spr_player_ratmountbump
        else
            sprite_index = spr_lonegustavo_bump
        with (obj_camera)
        {
            shake_mag = 20
            shake_mag_acc = (40 / room_speed)
        }
        image_speed = 0.35
        with (obj_baddie)
        {
            if (shakestun && point_in_camera(x, y, view_camera[0]) && grounded)
            {
                stun = 1
                alarm[0] = 200
                ministun = 0
                vsp = -5
                hsp = 0
            }
        }
        flash = 0
        state = (106 << 0)
        hsp = -2.5
        vsp = -3
        mach2 = 0
        image_index = 0
        instance_create((x + 10), (y + 10), obj_bumpeffect)
    }
    if (floor(image_index) == (image_number - 1))
    {
        if key_slap
        {
            movespeed += 2
            fmod_event_instance_play(snd_crouchslide)
            image_index = 3
        }
        else if key_attack
        {
            image_speed = 0.35
            state = (104 << 0)
            grav = 0.5
        }
        else if _cancel
        {
            image_speed = 0.35
            state = (0 << 0)
            grav = 0.5
        }
        else if (move != xscale && move != 0)
        {
            image_index = 0
            if (!grounded)
            {
                fmod_event_one_shot_3d("event:/sfx/pep/grabcancel", x, y)
                sprite_index = spr_suplexcancel
                movespeed -= 2
                jumpAnim = 1
                grav = 0.5
                state = (92 << 0)
            }
            else
            {
                state = (0 << 0)
                landAnim = 0
                movespeed = 2
                grav = 0.5
            }
        }
    }
    if (floor(image_index) >= (image_number - (image_number / 4)))
    {
        if key_slap2
        {
            fmod_event_instance_play(snd_crouchslide)
            movespeed += 4
            if (movespeed > 30)
                movespeed = 30
            image_index = 2
        }
    }
    if (key_down && vsp > 0 && (!((key_slap || key_slap2))))
    {
        if grounded
        {
            grav = 0.5
            if ispeppino
                sprite_index = spr_player_crouchslidestart
            else
                sprite_index = spr_crouchslip
            machhitAnim = 0
            state = (102 << 0)
            movespeed = 15
        }
        else
        {
            particle_set_scale((5 << 0), xscale, 1)
            create_particle(x, y, (5 << 0), 0)
            flash = 0
            state = (5 << 0)
            image_index = 0
            vsp = 10
            fmod_event_one_shot_3d("event:/sfx/pep/dive", x, y)
            sprite_index = spr_dive
        }
    }
    if ((!instance_exists(obj_dashcloud2)) && grounded && ispeppino && movespeed > 5)
    {
        with (instance_create(x, y, obj_dashcloud2))
            image_xscale = other.xscale
    }
}

