if (global.panic == 1 || (instance_exists(obj_wartimer) && room != war_1))
{
    image_index = 1
    if (!uparrow)
    {
        uparrowID = scr_create_uparrowhitbox()
        uparrow = 1
    }
}
else if uparrow
{
    uparrow = 0
    instance_destroy(uparrowID)
}
if (drop && global.panic)
{
    if (dropstate == (4 << 0))
    {
        sprite_index = spr_exitgategrabbed
        if (snd == 0)
        {
            fmod_event_one_shot_3d("event:/sfx/pep/hitwall", x, y)
            snd = ground_boundtitrle_cardd
        }
    }
    else
        sprite_index = spr_exitgate
    switch dropstate
    {
        case (0 << 0):
            if (distance_to_object(obj_player1) < 300)
            {
                dropstate = (15 << 0)
                handsprite = spr_grabbiehand_fall
                hand_y = (camera_get_view_y(view_camera[0]) - 100)
            }
            break
        case (15 << 0):
            if (hand_y < (y - 128))
                hand_y += 6
            else
            {
                handsprite = spr_grabbiehand_catch
                handindex = 0
                with (instance_create(obj_exitdoorsign.x, obj_exitdoorsign.y, obj_sausageman_dead))
                {
                    sprite_index = spr_exitsign
                    image_alpha = 1
                }
                with (instance_create(obj_exitdoorsignground.x, obj_exitdoorsignground.y, obj_sausageman_dead))
                {
                    sprite_index = obj_exitdoorsignground.sprite_index
                    image_xscale = obj_exitdoorsignground.image_xscale
                    image_alpha = 1
                }
                with (obj_exitdoorsign)
                    instance_destroy()
                dropstate = (4 << 0)
            }
            break
        case (4 << 0):
            depth = 150
            var _ty = (drop_y - 100)
            y = Approach(y, _ty, 3)
            hand_y = (y - 128)
            if (y == _ty && distance_to_object(obj_player1) < 200)
            {
                dropstate = (135 << 0)
                handindex = 0
                handsprite = spr_grabbiehand_release
                vsp = 0
            }
            break
        case (135 << 0):
            if (vsp < 20)
                vsp += grav
            y += vsp
            if (y >= drop_y)
            {
                depth = 50
                fmod_event_one_shot_3d("event:/sfx/pep/groundpound", x, y)
                y = drop_y
                dropstate = (126 << 0)
                handsprite = spr_grabbiehand_idle
                exitdoorsign = instance_create((x - 16), (y - 32), obj_exitdoorsign)
                exitdoorsign.depth = (depth - 1)
                with (obj_camera)
                {
                    shake_mag = 5
                    shake_mag_acc = (3 / room_speed)
                }
            }
            break
        case (126 << 0):
            hand_y -= 6
            break
    }

    if (handsprite == spr_grabbiehand_release && floor(handindex) == (sprite_get_number(handsprite) - 1))
        handindex = (sprite_get_number(handsprite) - 1)
    handindex += 0.35
}
