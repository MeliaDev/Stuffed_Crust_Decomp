function scr_player_cheesepep() //scr_player_cheesepep
{
    var coldown = collision_line((x + (2 * sign(hsp))), y, (x + (2 * sign(hsp))), (bbox_bottom + 8), obj_solid, false, true)
    var colup = collision_line(x, (bbox_bottom - 6), x, (bbox_top - 64), obj_solid, false, true)
    key_particles = 0
    mach2 = 0
    momemtum = 0
    alarm[5] = 2
    alarm[7] = 60
    move = (key_left + key_right)
    if (!(place_meeting(x, (y + 1), obj_railparent)))
        hsp = (xscale * movespeed)
    else
    {
        var _railinst = instance_place(x, (y + 1), obj_railparent)
        hsp = ((xscale * movespeed) + (_railinst.movespeed * _railinst.dir))
    }
    if (move != xscale && move != 0)
    {
        movespeed = 4
        xscale = move
    }
    if (grounded && move != 0 && sprite_index == spr_cheesepepidle)
        sprite_index = spr_cheesepepwalk
    else if (grounded && move == 0 && sprite_index == spr_cheesepepwalk)
        sprite_index = spr_cheesepepidle
    if (move != 0 && sprite_index != spr_cheesepepjumpstart)
    {
        xscale = move
        movespeed = Approach(movespeed, 6, 0.25)
    }
    else
        movespeed = Approach(movespeed, 0, 1)
    image_speed = 0.35
    if (grounded && (floor(image_index) % 4) == 0 && hsp != 0)
    {
        create_debris(x, (y + 43), 1523)
        fmod_event_one_shot_3d("event:/sfx/cheese/ground", x, y)
    }
    if (!grounded)
    {
        state = (26 << 0)
        sprite_index = spr_cheesepepfall
        jumpstop = 1
        movespeed = (xscale * movespeed)
    }
    if (floor(image_index) == (image_number - 1))
    {
        if (sprite_index == spr_cheesepepland || sprite_index == spr_cheesepepintro)
        {
            if (move != 0)
                sprite_index = spr_cheesepepwalk
            else
                sprite_index = spr_cheesepepidle
        }
    }
    if (input_buffer_jump > 0 && sprite_index != spr_cheesepepjumpstart)
    {
        if (sprite_index != spr_cheesepepland)
        {
            input_buffer_jump = 0
            image_index = 0
            sprite_index = spr_cheesepepjumpstart
        }
        else
            input_buffer_jump = 8
    }
    if (sprite_index == spr_cheesepepjumpstart && floor(image_index) == (image_number - 1))
    {
        create_particle(x, y, (3 << 0))
        vsp = -13
        image_index = 0
        sprite_index = spr_cheesepepjump
        state = (26 << 0)
        fmod_event_one_shot_3d("event:/sfx/cheese/jump", x, y)
    }
    if (place_meeting(x, (y - 16), obj_solid) && vsp <= 1)
    {
        stickdir = -1
        mask_index = spr_crouchmask
        y = floor(y)
        if (colup != -4)
        {
            while (!(place_meeting(x, (y - 1), obj_solid)))
                y--
        }
        hsp = 0
        vsp = -10
        cheesepep_buffer = cheesepep_max
        state = (30 << 0)
        stickdir = -1
        sprite_index = spr_cheesepepstickceiling
    }
}

