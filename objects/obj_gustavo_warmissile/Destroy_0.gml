instance_create(x, y, obj_playerexplosion)
if obj_player1.isgustavo
{
    with (instance_create(x, y, obj_brickcomeback))
    {
        vsp = -4
        sprite_index = spr_lonebrick_hurt
    }
}
else
{
    with (instance_create(x, y, obj_sausageman_dead))
    {
        depth = -200
        sprite_index = spr_lonebrick_hurt
        var ix = 1
        if (other.image_angle > 90)
            ix = -1
        hsp = (ix * 8)
        vsp = -12
        image_xscale = (-ix)
    }
}
destroy_sounds([snd])
if bbox_in_camera(view_camera[0], 78)
{
    GamepadSetVibration(0, 1, 1, 0.9)
    GamepadSetVibration(1, 1, 1, 0.9)
}
fmod_event_one_shot_3d("event:/sfx/misc/explosion", x, y)
