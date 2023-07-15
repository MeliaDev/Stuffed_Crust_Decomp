image_speed = 0.35
if (floor(image_index) == (image_number - 1) && sprite_index == spr_pizzahead_TVprojectilebounce)
    sprite_index = spr_pizzahead_TVprojectile
mask_index = spr_pizzahead_TVprojectile
if move
{
    if ((!grabbed) && (!ratgrabbed) && (!thrown))
    {
        hsp = (dir * spd)
        if (place_meeting(x, (y + 1), obj_solid) && vsp > 0)
        {
            if (bounce > 0)
            {
                fmod_event_one_shot_3d("event:/sfx/pizzahead/tvbounce", x, y)
                vsp = -18
                sprite_index = spr_pizzahead_TVprojectilebounce
                image_index = 0
                bounce--
                with (obj_camera)
                {
                    shake_mag = 3
                    shake_mag_acc = (5 / room_speed)
                }
            }
            else
            {
                instance_destroy(id, false)
                with (create_debris(x, y, 785))
                    image_index = 0
                with (create_debris(x, y, 785))
                    image_index = 1
                with (create_debris(x, y, 785))
                    image_index = 2
                move = 0
                hsp = 0
                alarm[0] = 150
            }
        }
        if place_meeting((x + sign(hsp)), y, obj_solid)
        {
            fmod_event_one_shot_3d("event:/sfx/pep/bumpwall", x, y)
            dir *= -1
            hsp *= -1
        }
    }
}
if grabbed
    hasgrabbed = 1
if (grabbed || vsp > 0)
    land = 1
if land
    depth = 0
event_inherited()
