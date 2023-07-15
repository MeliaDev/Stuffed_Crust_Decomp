function scr_player_cheesepepjump() //scr_player_cheesepepjump
{
    image_speed = 0.35
    if (floor(image_index) == (image_number - 1))
    {
        if (sprite_index == spr_cheesepepjumpstart || sprite_index == spr_cheesepepwalljump)
            sprite_index = spr_cheesepepjump
        else if (sprite_index == spr_cheesepepjump && vsp > 0)
            sprite_index = spr_cheesepepfall
    }
    hsp = movespeed
    move = (key_left + key_right)
    if ((!key_jump2) && (!jumpstop) && vsp < 0)
    {
        jumpstop = 1
        vsp /= 10
    }
    if (move != 0)
        movespeed = Approach(movespeed, (move * 3), 0.5)
    else
        movespeed = Approach(movespeed, 0, 0.25)
    if (place_meeting((x + sign(movespeed)), y, obj_solid) && (!(place_meeting(x, (y + 1), obj_slope))) && (!(place_meeting((x + sign(movespeed)), y, obj_ratblock))))
    {
        state = (25 << 0)
        fmod_event_one_shot_3d("event:/sfx/cheese/step", x, y)
        sprite_index = spr_cheesepepstickside
        hsp = 0
        vsp = 0
        xscale = sign(movespeed)
        repeat (3)
            create_debris((x + (xscale * 30)), (y + random_range(-8, 8)), 4085)
        movespeed = 0
    }
    if (input_buffer_jump > 0 && can_jump && (!grounded))
    {
        create_particle(x, y, (3 << 0))
        vsp = -11
        image_index = 0
        sprite_index = spr_cheesepepjump
        state = (26 << 0)
        fmod_event_one_shot_3d("event:/sfx/cheese/jump", x, y)
    }
    if (grounded && vsp > 0)
    {
        fmod_event_one_shot_3d("event:/sfx/cheese/step", x, y)
        repeat (3)
            create_debris((x + random_range(-8, 8)), (y + 43), 4085)
        state = (24 << 0)
        sprite_index = spr_cheesepepland
        image_index = 0
        movespeed = abs(movespeed)
    }
}

