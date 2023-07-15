if active
{
    with (obj_player)
    {
        state = (146 << 0)
        hsp = 0
        vsp = 0
        visible = false
        obj_screensizer.camzoom = lerp(obj_screensizer.camzoom, 1, 0.1)
        camera_set_view_size(view_camera[0], (obj_screensizer.actual_width * obj_screensizer.camzoom), (obj_screensizer.actual_height * obj_screensizer.camzoom))
    }
}
if (floor(image_index) == (image_number - 1))
{
    switch sprite_index
    {
        case spr_pizzaportal_appear:
            fmod_event_one_shot_3d("event:/sfx/misc/secretexit", x, y)
            if (obj_player.character == "N" || (obj_player.character == "P" && (!obj_player.ispeppino)))
                sprite_index = spr_playerN_pizzaportalstart
            else
                sprite_index = spr_pizzaportalentrancestart
            break
        case 4228:
        case 2202:
            sprite_index = spr_pizzaportal_disappear
            with (obj_player)
            {
                state = (0 << 0)
                visible = true
            }
            active = 0
            break
        case 2410:
            instance_create_unique(0, 0, 841)
            instance_destroy()
            break
    }

}
