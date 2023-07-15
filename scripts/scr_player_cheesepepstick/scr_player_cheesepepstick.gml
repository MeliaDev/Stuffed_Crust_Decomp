function scr_player_cheesepepstick() //scr_player_cheesepepstick
{
    hsp = 0
    vsp = 0
    if ((!grounded) && (!(place_meeting((x + 1), y, obj_solid))) && (!(place_meeting((x - 1), y, obj_solid))))
    {
        state = (26 << 0)
        jumpAnim = 0
        sprite_index = spr_cheesepepfall
    }
    if grounded
    {
        fmod_event_one_shot_3d("event:/sfx/cheese/step", x, y)
        state = (24 << 0)
        sprite_index = spr_cheesepepland
        image_index = 0
        landAnim = 1
    }
    move = (key_left + key_right)
    if (input_buffer_jump > 0)
    {
        input_buffer_jump = 0
        fmod_event_one_shot_3d("event:/sfx/cheese/jump", x, y)
        scr_fmod_soundeffect(jumpsnd, x, y)
        xscale *= -1
        dir = xscale
        state = (26 << 0)
        sprite_index = spr_cheesepepwalljump
        image_index = 0
        movespeed = (xscale * 4)
        if (!key_down)
            vsp = -13
    }
}

function scr_player_cheesepepstickside() //scr_player_cheesepepstickside
{
    sprite_index = spr_cheesepepstickside
    image_speed = 0.35
    alarm[5] = 2
    alarm[7] = 60
    hurted = 1
    move = (key_down - key_up)
    moveside = (key_left + key_right)
    if (move != 0)
        yscale = (-move)
    hsp = 0
    vsp = (move * movespeed)
    if (move != 0)
    {
        if (movespeed < 6)
            movespeed += 0.5
        else if (movespeed == 6)
            movespeed = 6
    }
    else
        movespeed = 0
    if place_meeting((x - 1), y, obj_solid)
        xscale = 1
    else if place_meeting((x + 1), y, obj_solid)
        xscale = -1
    if (input_buffer_jump > 0 && (!(scr_solid(x, (y - 16)))))
    {
        sprite_index = spr_cheesepepjump
        input_buffer_jump = 0
        x += xscale
        if (!key_down)
            vsp = -11
        image_index = 0
        state = (24 << 0)
        hsp = (move * movespeed)
        cheesepep_buffer = 0
    }
    if ((!(place_meeting((x + 1), y, obj_solid))) && (!(place_meeting((x - 1), y, obj_solid))))
    {
        grav = 0.5
        state = (24 << 0)
        sprite_index = spr_cheesepepidle
        hsp = (move * movespeed)
        cheesepep_buffer = 0
    }
    if (grounded && moveside == xscale)
    {
        cheesepep_buffer = 0
        grav = 0.5
        state = (24 << 0)
        sprite_index = spr_cheesepepidle
        hsp = (move * movespeed)
    }
    if scr_solid(x, y)
    {
        var tx = try_solid(xscale, 0, 517, 64)
        if (tx != -1)
            x += (tx * xscale)
        else
        {
            tx = try_solid((-xscale), 0, 517, 64)
            if (tx != -1)
                x -= (tx * xscale)
        }
    }
    var rvsp = round(vsp)
    if (rvsp == 0 && vsp != 0)
        rvsp = move
    var stickside = (xscale > 0 ? bbox_left : bbox_right)
    var bbox_y = (rvsp > 0 ? bbox_bottom : bbox_top)
    var colside = collision_line(x, (bbox_y + (sign(rvsp) * 2)), (stickside - (8 * xscale)), (bbox_y + (sign(rvsp) * 2)), obj_solid, false, true)
    if (rvsp != 0 && colside == -4 && scr_solid((x - xscale), y) && (!(place_meeting(x, (y + 1), obj_platform))))
    {
        if (cheesepep_buffer <= 0)
        {
            var old_x = x
            x -= xscale
            var ty = try_solid(0, sign(rvsp), 517, 64)
            if (ty != -1)
                y += (ty * sign(rvsp))
            x = old_x
            xscale = (-xscale)
            x += (16 * xscale)
            if (rvsp > 0)
            {
                stickdir = -1
                state = (30 << 0)
                sprite_index = spr_cheesepepstickceiling
                vsp = 0
                hsp = (xscale * movespeed)
            }
            else
            {
                state = (24 << 0)
                mask_index = spr_player_mask
                sprite_index = spr_cheesepepidle
                vsp = 0
                hsp = (xscale * movespeed)
            }
        }
        else
            vsp = 0
    }
}

function scr_player_cheesepepstickup() //scr_player_cheesepepstickup
{
    sprite_index = (stickdir == -1 ? spr_cheesepepstickceiling : spr_cheesepepstickfloor)
    image_speed = 0.35
    alarm[5] = 2
    alarm[7] = 60
    hurted = 1
    move = (key_left + key_right)
    vsp = 0
    if (!(place_meeting(x, (y + stickdir), obj_railparent)))
        hsp = (move * movespeed)
    else
    {
        var _railinst = instance_place(x, (y + stickdir), obj_railparent)
        hsp = ((move * movespeed) + (_railinst.movespeed * _railinst.dir))
    }
    if (move != 0)
        xscale = sign(move)
    if (move != 0)
    {
        if (movespeed < 6)
            movespeed += 0.5
        else if (movespeed == 6)
            movespeed = 6
    }
    else
        movespeed = 0
    if (move == sign(hsp) && place_meeting((x + sign(hsp)), y, obj_solid))
    {
        sprite_index = spr_cheesepepstickside
        cheesepep_buffer = cheesepep_max
        state = (29 << 0)
        vsp = (move * movespeed)
    }
    if (input_buffer_jump > 0 && (!((place_meeting(x, (y + 1), obj_solid) && place_meeting(x, (y - 1), obj_solid)))))
    {
        mask_index = spr_player_mask
        if place_meeting(x, y, obj_solid)
        {
            while place_meeting(x, y, obj_solid)
                y++
        }
        input_buffer_jump = 0
        state = (24 << 0)
        cheesepep_buffer = 0
        vsp = 2
        hsp = (move * movespeed)
    }
    if ((!(place_meeting(x, (y - 1), obj_solid))) && (!(place_meeting(x, (y + 1), obj_solid))))
    {
        state = (24 << 0)
        cheesepep_buffer = 0
        hsp = (move * movespeed)
    }
    if (!(place_meeting(x, (y + (4 * stickdir)), obj_solid)))
    {
        if (!(place_meeting(x, (y - (4 * stickdir)), obj_solid)))
        {
            state = (24 << 0)
            cheesepep_buffer = 2
            hsp = (move * movespeed)
            sprite_index = spr_cheesepepidle
        }
        else
        {
            state = (30 << 0)
            stickdir *= -1
        }
    }
    var _sideup = (stickdir == -1 ? bbox_top : bbox_bottom)
    var colup = collision_line((x + (xscale * 2)), y, (x + (xscale * 2)), (_sideup + (8 * stickdir)), obj_solid, false, true)
    if (colup == -4 && scr_solid(x, (y + stickdir)))
    {
        if (cheesepep_buffer <= 0)
        {
            var old_y = y
            y += stickdir
            tx = try_solid(xscale, 0, 517, 64)
            if (tx != -1)
                x += (tx * xscale)
            y = old_y
            y += (16 * stickdir)
            cheesepep_buffer = cheesepep_max
            state = (29 << 0)
            sprite_index = spr_cheesepepstickside
            hsp = 0
            vsp = (move * movespeed)
        }
        else
            hsp = 0
    }
}

