function scr_player_ladder() //scr_player_ladder
{
    jumpAnim = 1
    dashAnim = 1
    landAnim = 0
    moveAnim = 1
    stopAnim = 1
    crouchslideAnim = 1
    crouchAnim = 0
    machhitAnim = 0
    turning = 0
    jumpstop = 0
    movespeed = 0
    hsp = 0
    if (key_up && hooked == 0)
    {
        sprite_index = spr_laddermove
        vsp = -6
        if (steppybuffer > 0)
            steppybuffer--
        else
        {
            create_particle(x, (y + 43), (1 << 0), 0)
            steppybuffer = 12
            fmod_event_one_shot_3d("event:/sfx/pep/step", x, y)
        }
        image_speed = 0.35
    }
    else if (key_down && hooked == 0)
    {
        sprite_index = spr_ladderdown
        vsp = 10
        image_speed = -0.35
    }
    else
    {
        sprite_index = spr_Ladder
        vsp = 0
    }
    mach2 = 0
    jumpAnim = 1
    dashAnim = 1
    landAnim = 0
    moveAnim = 1
    stopAnim = 1
    crouchslideAnim = 1
    crouchAnim = 1
    machhitAnim = 0
    if ((!(place_meeting(x, y, obj_ladder))) && (!(place_meeting(x, y, obj_stairs))))
    {
        landAnim = 0
        jumpAnim = 0
        state = (0 << 0)
        image_index = 0
        if ((!hooked) && vsp < 0)
        {
            var _y = y
            while (!(scr_solid(x, (y + 1))))
            {
                y++
                if scr_solid(x, y)
                {
                    y--
                    break
                }
                else if (y > (room_height + 300))
                {
                    y = _y
                    break
                }
                else
                    continue
            }
        }
        vsp = 0
        hooked = 0
    }
    if (input_buffer_jump > 0)
    {
        input_buffer_jump = 0
        hooked = 0
        sprite_index = spr_jump
        ladderbuffer = 20
        if place_meeting(x, y, obj_hookup)
            ladderbuffer = 30
        jumpAnim = 1
        state = (92 << 0)
        if key_down
            vsp = 5
        else
            vsp = -9
        image_index = 0
    }
    if (key_slap2 && (!key_up) && cangrab)
    {
        input_buffer_slap = 0
        if shotgunAnim
            sprite_index = spr_shotgunsuplexdash
        else
            sprite_index = spr_suplexdash
        angle = 0
        suplexmove = 1
        particle_set_scale((5 << 0), xscale, 1)
        create_particle(x, y, (5 << 0), 0)
        fmod_event_instance_play(suplexdashsnd)
        state = (42 << 0)
        movespeed = 8
        image_index = 0
    }
    else if (key_slap2 && key_up && uppercutbuffer == 0)
    {
        state = (80 << 0)
        input_buffer_slap = 0
        image_index = 0
        vsp = -15
        ladderbuffer = 20
        sprite_index = spr_uppercut
        fmod_event_instance_play(snd_uppercut)
        movespeed = hsp
        particle_set_scale((4 << 0), xscale, 1)
        create_particle(x, y, (4 << 0), 0)
    }
    else if (key_slap2 && character == "V")
    {
        if grounded
            vsp = -3
        else
            vsp = -5
        state = (1 << 0)
        image_index = 0
        sprite_index = spr_playerV_airrevolver
        image_index = 0
        with (instance_create((x + (xscale * 20)), (y + 20), obj_shotgunbullet))
        {
            is_solid = 0
            sprite_index = spr_cheesebullet
            image_xscale = other.xscale
        }
        fmod_event_one_shot_3d("event:/sfx/enemies/kill", x, y)
    }
    if (key_down && grounded && (!(place_meeting(x, y, obj_platform))))
    {
        state = (0 << 0)
        image_index = 0
    }
}

