var playerid = obj_player1
if (obj_player1.spotlight == 0)
    playerid = obj_player2
fmod_event_instance_set_3d_attributes(snd, x, y)
if (!fmod_event_instance_is_playing(snd))
    fmod_event_instance_play(snd)
if (!instance_exists(playerid))
    return;
var _move = 1
with (obj_player)
{
    if (state == (119 << 0) || (!visible) || cutscene || state == (98 << 0) || state == (90 << 0) || state == (46 << 0) || state == (112 << 0) || state == (292 << 0))
        _move = 0
}
if (!treasure)
{
    if (sprite_index == spr_pizzaface_laughspawn)
    {
        if (floor(image_index) == (image_number - 1))
            sprite_index = spr_pizzaface
    }
    if (image_alpha >= 1)
    {
        if ((!instance_exists(obj_fadeout)) && (!obj_player1.cutscene))
        {
            if _move
            {
                var dir = point_direction(x, y, playerid.x, playerid.y)
                x += lengthdir_x(maxspeed, dir)
                y += lengthdir_y(maxspeed, dir)
            }
        }
    }
    else
        image_alpha += 0.01
}
else
{
    x = -200
    y = -200
}
if (!_move)
    image_alpha = Approach(image_alpha, 0, 0.1)
if (_move && place_meeting(x, y, playerid) && (!playerid.cutscene) && playerid.state != (146 << 0) && (!instance_exists(obj_fadeout)) && (!instance_exists(obj_endlevelfade)) && image_alpha >= 1)
{
    fmod_event_instance_stop(snd, 1)
    with (playerid)
    {
        instance_destroy(obj_fadeout)
        targetDoor = "A"
        room = timesuproom
        state = (64 << 0)
        sprite_index = spr_Timesup
        image_index = 0
        if isgustavo
            sprite_index = spr_player_ratmounttimesup
        visible = true
        image_blend = c_white
        stop_music()
        fmod_event_one_shot("event:/music/timesup")
    }
    instance_destroy()
}
if (image_alpha >= 1)
{
    if (maxspeed < realmaxspeed)
        maxspeed += 0.01
    if (distance_to_object(playerid) > 400)
        realmaxspeed = 4
    else if (distance_to_object(playerid) < 200)
        realmaxspeed = 2
    else
        realmaxspeed = 2
}
