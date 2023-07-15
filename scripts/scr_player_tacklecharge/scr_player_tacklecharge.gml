function scr_player_tacklecharge() //scr_player_tacklecharge
{
    if (windingAnim < 2000)
        windingAnim++
    if (!(place_meeting(x, (y + 1), obj_railparent)))
        hsp = (xscale * movespeed)
    else
    {
        var _railinst = instance_place(x, (y + 1), obj_railparent)
        hsp = ((xscale * movespeed) + (_railinst.movespeed * _railinst.dir))
    }
    move2 = (key_right2 + key_left2)
    move = (key_right + key_left)
    crouchslideAnim = 1
    if (movespeed < 20 && move == xscale)
        movespeed += 0.04
    if ((!key_jump2) && jumpstop == 0 && vsp < 0.5)
    {
        vsp /= 20
        jumpstop = 1
    }
    if (grounded && vsp > 0)
        jumpstop = 0
    if (input_buffer_jump > 0 && can_jump)
    {
        input_buffer_jump = 0
        image_index = 0
        sprite_index = spr_secondjump1
        scr_fmod_soundeffect(jumpsnd, x, y)
        vsp = -11
    }
    if (scr_solid((x + hsp), y) && (!(place_meeting((x + hsp), y, obj_slope))) && (!(place_meeting((x + hsp), y, obj_destructibles))))
    {
        if (baddiegrabbedID != obj_null)
        {
            with (baddiegrabbedID)
            {
                other.thrown = 1
                instance_create(x, y, obj_slapstar)
                instance_create(x, y, obj_baddiegibs)
                other.flash = 1
                x = other.x
                y = other.y
                state = (107 << 0)
                hsp = ((-image_xscale) * 10)
                vsp = -10
                alarm[8] = 60
                alarm[7] = 120
                other.baddiegrabbedID = 741
                hp = 0
                elitehit = 0
                instance_destroy()
            }
        }
        movespeed = 0
        hsp = 0
        if ispeppino
            sprite_index = spr_player_backflip
        else
            sprite_index = spr_playerN_spin
        state = (106 << 0)
        hsp = (-3 * xscale)
        vsp = -6
        mach2 = 0
        image_index = 0
        instance_create((x + 10), (y + 10), obj_bumpeffect)
        return;
    }
    else
    {
        sprite_index = spr_charge
        image_speed = (abs(movespeed) / 16)
    }
    if (key_down && grounded)
    {
        sprite_index = spr_crouchslip
        if (character == "P")
            machhitAnim = 0
        state = (102 << 0)
    }
    if (((!key_attack) || move == 0) && grounded)
    {
        image_index = 0
        state = (105 << 0)
        sprite_index = spr_machslidestart
    }
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
    if (move == (-xscale) && grounded)
    {
        xscale = move
        image_index = 0
        movespeed -= 3
        if (movespeed < 5)
            movespeed = 5
    }
    if (move == 0 && (!key_attack) && grounded)
    {
        if (movespeed <= 10)
            sprite_index = spr_haulingstart
        else
            sprite_index = spr_swingding
        if (!grounded)
            vsp = -6
        swingdingendcooldown = 0
        state = (79 << 0)
        grabbingenemy = 1
    }
    if ((!instance_exists(dashcloudid)) && grounded)
    {
        with (instance_create(x, y, obj_dashcloud))
        {
            image_xscale = other.xscale
            other.dashcloudid = id
        }
    }
    if ((!instance_exists(chargeeffectid)) && movespeed >= 12)
    {
        with (instance_create(x, y, obj_chargeeffect))
        {
            playerid = other.object_index
            other.chargeeffectid = id
        }
    }
}

