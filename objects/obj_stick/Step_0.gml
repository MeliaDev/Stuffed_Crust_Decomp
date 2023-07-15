if (sprite_index != spr_stick_helicopter && (sprite_index != spr_stick_leave || image_index < 3))
{
    fmod_event_instance_stop(global.snd_mrstickhat, 1)
    scr_collide()
}
else
{
    if (!fmod_event_instance_is_playing(global.snd_mrstickhat))
        fmod_event_instance_play(global.snd_mrstickhat)
    fmod_event_instance_set_3d_attributes(global.snd_mrstickhat, x, y)
}
switch state
{
    case (135 << 0):
        if (sprite_index == spr_stick_helicopter)
        {
            hsp = 0
            vsp = 0
            y += 5
            if (abs((y - obj_stick_target.y)) <= 100)
            {
                sprite_index = spr_stick_fall
                image_index = 0
            }
        }
        else if (sprite_index == spr_stick_fall)
        {
            if (grounded && vsp > 0)
            {
                sprite_index = spr_stick_land
                image_index = 0
            }
        }
        else if (floor(image_index) == (image_number - 1))
            state = (0 << 0)
        break
    case (0 << 0):
        if (arrowID == noone)
            arrowID = scr_create_uparrowhitbox()
        if (sprite_index != spr_stick_idleanim1 && sprite_index != spr_stick_idleanim2 && sprite_index != spr_stick_idleanim3)
            sprite_index = spr_stick_idle
        else if (floor(image_index) == (image_number - 1))
            sprite_index = spr_stick_idle
        if (sprite_index == spr_stick_idle)
        {
            idle++
            if (obj_player1.x != x)
                image_xscale = sign((obj_player1.x - x))
        }
        if (idle >= 200)
        {
            if (!instance_exists(obj_titlecard))
                fmod_event_one_shot_3d("event:/sfx/voice/mrstick", x, y)
            sprite_index = choose(spr_stick_idleanim1, spr_stick_idleanim2, spr_stick_idleanim3)
            image_index = 0
            idle = 0
        }
        if ((!drawing) && place_meeting(x, y, obj_player))
            drawing = 1
        else if (drawing && (!(place_meeting(x, y, obj_player))))
            drawing = 0
        if (drawing && obj_player1.key_up && (global.pigtotal - global.pigreduction) >= maxscore)
        {
            fmod_event_one_shot_3d("event:/sfx/misc/kashing", x, y)
            instance_destroy(arrowID)
            obj_stick_forsale.visible = false
            ini_open_from_string(obj_savesystem.ini_str)
            ini_write_real(save, "unlocked", 1)
            ini_write_real(save, "reduction", maxscore)
            global.pigreduction += maxscore
            obj_savesystem.ini_str = ini_close()
            state = (92 << 0)
            sprite_index = spr_stick_takemoney1
            image_index = 0
            shot = 0
            drawing = 0
            gamesave_async_save()
            with (obj_player)
            {
                hsp = 0
                vsp = 0
                sprite_index = spr_idle
                image_speed = 0.35
                state = (146 << 0)
                xscale = (-other.image_xscale)
            }
        }
        break
    case (92 << 0):
        if shot
        {
            with (obj_player1)
                hsp = Approach(hsp, 0, 0.1)
        }
        if (sprite_index == spr_stick_takemoney1)
        {
            if (floor(image_index) >= 16 && (!shot))
            {
                shot = 1
                fmod_event_one_shot_3d("event:/sfx/pep/bumpwall", x, y)
                with (obj_player1)
                {
                    hsp = ((-xscale) * 4)
                    if (!isgustavo)
                        sprite_index = spr_bump
                    else if brick
                        sprite_index = spr_player_ratmountbump
                    else
                        sprite_index = spr_lonegustavo_bump
                }
            }
            if (floor(image_index) == (image_number - 1))
            {
                image_xscale *= -1
                sprite_index = spr_stick_takemoney2
                image_index = 0
                fmod_event_one_shot_3d("event:/sfx/voice/mrsticklaugh", x, y)
            }
        }
        else if (sprite_index == spr_stick_takemoney2)
        {
            hsp = (image_xscale * 4)
            if (abs((x - xstart)) >= 200 || (place_meeting((x + sign(hsp)), y, obj_solid) && (!(place_meeting((x + sign(hsp)), y, obj_slope)))))
            {
                hsp = 0
                sprite_index = spr_stick_leave
                image_index = 0
            }
        }
        else if (sprite_index == spr_stick_leave)
        {
            vsp = 0
            if (floor(image_index) >= 10)
                y -= 4
            if (floor(image_index) == (image_number - 1))
                sprite_index = spr_stick_helicopter
        }
        else
        {
            vsp = 0
            y -= 8
            if (y <= (camera_get_view_y(view_camera[0]) - 150) && instance_exists(obj_stick_forsale))
            {
                with (obj_stick_forsale)
                {
                    first = 1
                    unlocked = 1
                    with (instance_create(x, y, obj_stick_gateprop))
                    {
                        targetRoom = other.targetRoom
                        if (room != tower_5)
                        {
                            group_arr = other.group_arr
                            sprite_index = other.gate_sprite
                            bgsprite = other.bgsprite
                        }
                        else
                            sprite_index = spr_pizzafacedoor
                        depth = 250
                        y_to = other.y
                        y += sprite_get_height(sprite_index)
                    }
                    instance_destroy()
                }
                with (obj_player1)
                {
                    state = (0 << 0)
                    landAnim = 0
                }
            }
            if (y <= -200 && (!instance_exists(obj_stick_forsale)))
                instance_destroy()
        }
        break
}

money_y = Wave(-5, 5, 2, 2)
