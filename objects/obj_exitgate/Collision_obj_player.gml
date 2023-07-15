if (image_index == 1 && global.panic == 0 && room != war_13)
{
    with (obj_player)
    {
        if (state == (95 << 0))
        {
            if (floor(image_index) == (image_number - 2))
            {
                fmod_event_one_shot_3d("event:/sfx/pep/groundpound", x, y)
                GamepadSetVibration(0, 1, 1, 0.9)
                GamepadSetVibration(1, 1, 1, 0.9)
                groundpoundjumpanim = 0
                angle = 0
                if obj_camera.visible
                {
                    if (global.hardmode && (!((room == strongcold_endscreen || room == rank_room || room == timesuproom || room == Realtitlescreen || room == characterselect))))
                    {
                        if (!instance_exists(obj_hardmode_ghost))
                            instance_create(obj_player1.x, obj_player1.y, obj_hardmode_ghost)
                    }
                }
                if (!instance_exists(obj_panicdebris))
                    instance_create(-10, -10, obj_panicdebris)
                with (obj_player1)
                {
                    lastroom = room
                    if (sprite_index != spr_Timesup)
                    {
                        sprite_index = spr_Timesup
                        image_index = 0
                        with (obj_camera)
                        {
                            shake_mag = 10
                            shake_mag_acc = (30 / room_speed)
                        }
                    }
                }
                if (global.coop == 1)
                {
                    with (obj_player2)
                    {
                        lastroom = room
                        sprite_index = spr_Timesup
                        image_index = 0
                        with (obj_camera)
                        {
                            shake_mag = 10
                            shake_mag_acc = (30 / room_speed)
                        }
                    }
                }
                other.image_index = 0
                ds_list_add(global.saveroom, other.id)
            }
            else if (sprite_index != spr_Timesup)
            {
                with (obj_camera)
                {
                    shake_mag = 0
                    shake_mag_acc = 0
                }
            }
        }
    }
}
if (drop && dropstate != (126 << 0))
    return;
with (obj_player)
{
    if (grounded && x > (other.x - 160) && x < (other.x + 160) && key_up && (state == (0 << 0) || state == (99 << 0) || state == (103 << 0) || state == (104 << 0) || state == (121 << 0)) && (global.panic == 1 || global.snickchallenge == 1 || room == war_13))
    {
        if (global.cowboyhat == 1)
        {
            with (instance_create(x, y, obj_sausageman_dead))
            {
                sprite_index = spr_cowboyhat1
                image_index = 0
                image_alpha = 1
            }
            global.cowboyhat = 0
        }
        global.noisejetpack = 0
        global.startgate = 0
        stop_music()
        if (global.collect <= 0)
            global.collect = 10
        global.level_realminutes = global.level_minutes
        global.level_realseconds = global.level_seconds
        scr_do_rank()
    }
}
