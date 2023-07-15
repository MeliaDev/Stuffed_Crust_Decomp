maxspeed = 8
image_speed = 0.35
depth = -5
savedcx = camera_get_view_x(view_camera[0])
savedcy = camera_get_view_y(view_camera[0])
savedx = x
savedy = y
x = obj_player1.x
y = obj_player1.y
alarm[1] = 10
image_alpha = 0
treasure = 0
snd = fmod_event_create_instance("event:/sfx/pizzaface/moving")
muffle = 0.1
realmaxspeed = 2.5
var playerid = 530
if (playerid.x >= x)
    playerside = 1
else
    playerside = 0
prevplayerside = playerside
slowdown = 0
if (!instance_exists(obj_objecticontracker))
{
    with (instance_create(x, y, obj_objecticontracker))
    {
        objectID = other.id
        sprite_index = spr_icon_pizzaface
        image_speed = 0.18
    }
}
supertaunted = 0
